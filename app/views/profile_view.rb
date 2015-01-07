class ProfileView < UIViewController
  def viewDidLoad
    @array = []
    rmq.stylesheet = ProfileViewStyleSheet
    self.navigationController.navigationBar.setBarTintColor(rmq.color.from_hex("81F3FD"))
    
    rightButton = UIBarButtonItem.alloc.initWithTitle("Home", style: UIBarButtonItemStyleBordered, target: self, action: "home_navigation")
    barButtonTitle = NSDictionary.dictionaryWithObjectsAndKeys(UIColor.whiteColor, UITextAttributeTextColor,UIFont.fontWithName("HelveticaNeue-Bold", size: 17),NSFontAttributeName, nil)
    UIBarButtonItem.appearance.setTitleTextAttributes(barButtonTitle, forState: UIControlStateNormal)
    self.navigationItem.rightBarButtonItem = rightButton
    
    leftButton = UIBarButtonItem.alloc.initWithTitle("Save Profile", style: UIBarButtonItemStyleBordered, target: self, action: "upload")
    UIBarButtonItem.appearance.setTitleTextAttributes(barButtonTitle, forState: UIControlStateNormal)
    self.navigationItem.leftBarButtonItem = leftButton
    
    view.backgroundColor = rmq.color.from_hex("34AADC")
    #scroll = rmq.append(UIScrollView, :scroll_view).get
    
    rmq.append(UILabel, :heading)
    @full_text = rmq.append(UITextField, :full_name).get
    @full_text.placeholder = "Full Name"
    @full_text.layer.cornerRadius = 5
    @full_text.clipsToBounds = true
    
    @age_text = rmq.append(UITextField, :age).get
    @age_text.placeholder = "Age"
    @age_text.layer.cornerRadius = 5
    @age_text.clipsToBounds = true
    
    @gender_text = rmq.append(UITextField, :gender).get
    @gender_text.placeholder = "Gender: (e.g: Male/Female)"
    @gender_text.layer.cornerRadius = 5
    @gender_text.clipsToBounds = true
    
    @sos_text = rmq.append(UITextField, :sos).get
    @sos_text.placeholder = 'SOS Message (e.g: "Help Me")'
    @sos_text.layer.cornerRadius = 5
    @sos_text.clipsToBounds = true
    
    @ph_text1 = rmq.append(UITextField, :ph_no1).get
    @ph_text1.placeholder = 'Phone number'
    @ph_text1.layer.cornerRadius = 5
    @ph_text1.clipsToBounds = true
    
    rmq.append(UIButton, :add_button).on(:tap) {add_phone}
    
    image = UIImageView.alloc.initWithImage(UIImage.imageNamed("yourhelp"))
    image.frame = CGRectMake(50, 450,image.size.width, image.size.height)
    image.alpha = 1.0
    view.addSubview(image)
  end
  
  def add_phone
    if @ph_text1.text.length != 10
      alert = UIAlertView.alloc.initWithTitle("Alert", message: "please enter valid phone number", delegate: nil, cancelButtonTitle: "OK", otherButtonTitles: nil)
      alert.show
    elsif @array.count < 5
      @array << @ph_text1.text
      @ph_text1.text = ""
    else
      alert = UIAlertView.alloc.initWithTitle("Alert", message: "Only five phone number can add", delegate: nil, cancelButtonTitle: "OK", otherButtonTitles: nil)
      alert.show
      @ph_text1.text = ""
    end
  end
  
  def home_navigation
    self.navigationController.popToRootViewControllerAnimated(true)
  end
  
  def upload
    if @full_text.text != "" && @age_text.text != "" && @gender_text.text != "" && @sos_text.text != "" && @array.count == 5
      Profile_data.create_or_update(@full_text.text, @age_text.text, @gender_text.text, @sos_text.text, @array[0], @array[1], @array[2], @array[3], @array[4])
      self.navigationController.popToRootViewControllerAnimated(true)
      alert = UIAlertView.alloc.initWithTitle("Alert", message: "Data Saved", delegate: nil, cancelButtonTitle: "OK", otherButtonTitles: nil)
      alert.show
    else
      alert = UIAlertView.alloc.initWithTitle("Alert", message: "Please give all details in the respective text fields", delegate: nil, cancelButtonTitle: "OK", otherButtonTitles: nil)
      alert.show
    end
  end
  def self.phone_array
    @array
  end
end