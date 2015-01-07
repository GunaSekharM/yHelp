class DeviceStatus < UIViewController
  def viewDidLoad
    view.backgroundColor = rmq.color.from_hex("34AADC")
    rmq.stylesheet = DeviceStatusStyleSheet
    self.navigationController.navigationBar.setBarTintColor(rmq.color.from_hex("34AADC"))
    
    leftButton = UIBarButtonItem.alloc.initWithTitle("Home", style: UIBarButtonItemStyleBordered, target: self, action: "home_navigation")
    barButtonTitle = NSDictionary.dictionaryWithObjectsAndKeys(UIColor.whiteColor, UITextAttributeTextColor,UIFont.fontWithName("HelveticaNeue-Bold", size: 17),NSFontAttributeName, nil)
    UIBarButtonItem.appearance.setTitleTextAttributes(barButtonTitle, forState: UIControlStateNormal)
    self.navigationItem.leftBarButtonItem = leftButton
    
    myLabel = rmq.append(UILabel, :deviceLabel).get
    myLabel.textAlignment = NSTextAlignmentCenter
    
    rmq.append(UILabel, :gpsLabel)
    rmq.append(UILabel, :latitude_label).get
    
    @myLabel1 = rmq.append(UILabel, :latitude_value).get
    @myLabel1.layer.cornerRadius = 5
    @myLabel1.clipsToBounds = true
    
    rmq.append(UILabel, :longitude_label)
    @myLabel2 = rmq.append(UILabel, :longitude_value).get
    @myLabel2.layer.cornerRadius = 5 
    @myLabel2.clipsToBounds = true
    
    rmq.append(UILabel, :batteryLabel)
    myLabel3 = rmq.append(UILabel, :batteryLabelValue).get
    myLabel3.layer.cornerRadius = 5 
    myLabel3.clipsToBounds = true
    myLabel3.textAlignment = NSTextAlignmentCenter
    
    image = UIImageView.alloc.initWithImage(UIImage.imageNamed("device"))
    image.frame = CGRectMake(30, 80,image.size.width, image.size.height)
    view.addSubview(image)
    
    image = UIImageView.alloc.initWithImage(UIImage.imageNamed("navigation"))
    image.frame = CGRectMake(30, 250,image.size.width, image.size.height)
    view.addSubview(image)
    
    image = UIImageView.alloc.initWithImage(UIImage.imageNamed("battery.jpg"))
    image.frame = CGRectMake(30, 462,image.size.width, image.size.height)
    view.addSubview(image)
    
    myDevice = UIDevice.currentDevice
    myDevice.setBatteryMonitoringEnabled(true)
    batLeft = myDevice.batteryLevel
    myLabel3.text = "Battery charge level: "+ (batLeft*100).round.abs.to_s + "%"
    startCapture
  end
  
  def startCapture
    @locationManager = CLLocationManager.alloc.init
    @locationManager.delegate = self
    @locationManager.desiredAccuracy = KCLLocationAccuracyBest
    if UIDevice.currentDevice.systemVersion.floatValue >= 8.0
      @locationManager.requestWhenInUseAuthorization
    end
    @locationManager.startUpdatingLocation
  end
  
  def home_navigation
    self.navigationController.popToRootViewControllerAnimated(true)
  end
  
  def locationManager(manager, didFailWithError: error)
    NSLog("didFailWithError: #{error.localizedDescription}")
    errorAlert = UIAlertView.alloc.initWithTitle("Error", message: "Failed to get Your Location", delegate: nil, cancelButtonTitle: "OK", otherButtonTitles: nil)
    errorAlert.show
  end
  
  def locationManager(manager, didUpdateLocations: locations)
    @latitude = (locations.lastObject.coordinate.latitude).to_s
    @longitude = (locations.lastObject.coordinate.longitude).to_s
    @myLabel1.text = @latitude
    @myLabel2.text = @longitude
  end

end

