class ProfileViewController < UIViewController
  def viewDidLoad
    rmq.stylesheet = ProfileViewControllerStyleSheet
    self.navigationController.navigationBar.setBarTintColor(rmq.color.from_hex("81F3FD"))
    
    rightButton = UIBarButtonItem.alloc.initWithTitle("Home", style: UIBarButtonItemStyleBordered, target: self, action: "home_navigation")
    barButtonTitle = NSDictionary.dictionaryWithObjectsAndKeys(UIColor.whiteColor, UITextAttributeTextColor,UIFont.fontWithName("HelveticaNeue-Bold", size: 17),NSFontAttributeName, nil)
    UIBarButtonItem.appearance.setTitleTextAttributes(barButtonTitle, forState: UIControlStateNormal)
    self.navigationItem.rightBarButtonItem = rightButton
    
    leftButton = UIBarButtonItem.alloc.initWithTitle("Save Profile", style: UIBarButtonItemStyleBordered, target: self, action: "upload")
    UIBarButtonItem.appearance.setTitleTextAttributes(barButtonTitle, forState: UIControlStateNormal)
    self.navigationItem.leftBarButtonItem = leftButton
    
    rmq.append(ProfileView, :root_view)
    rmq.stylesheet = ProfileViewControllerStyleSheet
    @phone_numbers = []
  end
  
  def add_phone
    if rmq(:phone_number_text).valid?
      if @phone_numbers.count < 5
        @phone_numbers << rmq(:phone_number_text).get.text
        rmq(:phone_number_text).get.text = ""
        NSLog("#{@phone_numbers}")
      else
        alert("Only five phone number can add")
        rmq(:phone_number_text).get.text = ""
      end
    else
      alert("please enter exact 10 digits")
    end
  end
  
  def home_navigation
    self.navigationController.popToRootViewControllerAnimated(true)
  end
  
  def upload
    if rmq(:full_name_text).get.text != "" && rmq(:age_text).valid? && rmq(:gender_text).get.text != "" && rmq(:sos_text).get.text != "" && @phone_numbers.count <= 5
      ProfileData.create_or_update(rmq(:full_name_text).get.text, rmq(:age_text).get.text, rmq(:gender_text).get.text, rmq(:sos_text).get.text, @phone_numbers[0], @phone_numbers[1], @phone_numbers[2], @phone_numbers[3], @phone_numbers[4])
      self.navigationController.popToRootViewControllerAnimated(true)
      alert("Data Saved")
    else
      alert("give all details in the respective text fields")
    end
  end
  
  def alert(message)
    App.alert("Alert", {cancel_button_title: "OK", message: message})
  end
  
  def self.phone_array
    @phone_numbers
  end
end