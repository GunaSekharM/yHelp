class DeviceStatusController < UIViewController
  def viewDidLoad
    view.backgroundColor = rmq.color.from_hex("34AADC")
    rmq.stylesheet = DeviceStatusControllerStyleSheet
    self.navigationController.navigationBar.setBarTintColor(rmq.color.from_hex("34AADC"))
    rmq.append(DeviceStatusView, :root_view)
    leftButton = UIBarButtonItem.alloc.initWithTitle("Home", style: UIBarButtonItemStyleBordered, target: self, action: "home_navigation")
    barButtonTitle = NSDictionary.dictionaryWithObjectsAndKeys(UIColor.whiteColor, UITextAttributeTextColor,UIFont.fontWithName("HelveticaNeue-Bold", size: 17),NSFontAttributeName, nil)
    UIBarButtonItem.appearance.setTitleTextAttributes(barButtonTitle, forState: UIControlStateNormal)
    self.navigationItem.leftBarButtonItem = leftButton
    BW::Location.get_once do |location|
      if location.is_a?(CLLocation)
        #puts location
        rmq(:latitude_value).get.text = (location.latitude).to_s
        rmq(:longitude_value).get.text = (location.longitude).to_s
        #puts location.coordinate.latitude
      end
    end
    battery_charging_value
  end
  
  def battery_charging_value
    bat_left = MainController.battery_percentage
    rmq(:battery_value).get.text = "Battery charge level: "+ (bat_left*100).round.abs.to_s + "%"
  end
  
  def home_navigation
    self.navigationController.popToRootViewControllerAnimated(true)
  end
end

