class MainController < UIViewController 

  def viewDidLoad
    super
    self.edgesForExtendedLayout = UIRectEdgeNone

    rmq.stylesheet = MainStylesheet
    self.title = 'Get Help'
    rmq(self.view).apply_style :root_view
    self.navigationController.navigationBar.setBarTintColor(rmq.color.from_hex("1AD6FD"))
    rmq.append(UILabel, :profile_label).on(:tap){ profile }
    rmq.append(UILabel, :send_sms_label).on(:tap){ send_sms }
    rmq.append(UILabel, :Device_label).on(:tap) { device_status }
    
    image = UIImageView.alloc.initWithImage(UIImage.imageNamed("contact"))
    image.frame = CGRectMake(35, 60,image.size.width, image.size.height)
    view.addSubview(image)
    
    image1 = UIImageView.alloc.initWithImage(UIImage.imageNamed("sms"))
    image1.frame = CGRectMake(35, 230,image1.size.width, image1.size.height)
    view.addSubview(image1)
    
    image2 = UIImageView.alloc.initWithImage(UIImage.imageNamed("setting"))
    image2.frame = CGRectMake(35, 400,image1.size.width, image1.size.height)
    view.addSubview(image2)
    
    @locationManager = CLLocationManager.alloc.init
    @locationManager.delegate = self
    @locationManager.desiredAccuracy = KCLLocationAccuracyBest
    if UIDevice.currentDevice.systemVersion.floatValue >= 8.0
      @locationManager.requestWhenInUseAuthorization
    end
    @locationManager.startUpdatingLocation
  end
  
  def profile
    if Profile_data.data.count < 1
      self.navigationController.pushViewController(ProfileView.new, animated: true)
    else
      alert = UIAlertView.alloc.initWithTitle("Alert", message: "You already entered details in profile", delegate: nil, cancelButtonTitle: "OK", otherButtonTitles: nil)
      alert.show
    end
  end
  
  def send_sms
    if Profile_data.data.count < 1
      alert = UIAlertView.alloc.initWithTitle("Alert", message: "Please fill details to send SMS in profile", delegate: nil, cancelButtonTitle: "OK", otherButtonTitles: nil)
      alert.show
    else
      myDevice = UIDevice.currentDevice
      myDevice.setBatteryMonitoringEnabled(true)
      batLeft = myDevice.batteryLevel
      array = Profile_data.data 
      message = MFMessageComposeViewController.alloc.init.autorelease
      if MFMessageComposeViewController.canSendText
        message.body = "My name is #{array[0].fullName},\nMy age is #{array[0].age},\n i am #{array[0].gender},\nand i want to send my following Message: #{array[0].message},\nMy Phone Status:,\nBattery charge level: #{(batLeft*100).round.abs.to_s}%,\nMy Gps coordinates:\nLatitude: #{@latitude},\nLongitude: #{@longitude}\nand google map link https://maps.google.com/maps?q=#{@latitude},#{@longitude}"
        message.recipients = [array[0].phone_number1, array[0].phone_number2, array[0].phone_number3, array[0].phone_number4, array[0].phone_number5]
        message.messageComposeDelegate = self
        self.presentViewController(message, animated: true, completion: nil)
      end
    end
  end
  
  def locationManager(manager, didFailWithError: error)
    NSLog("didFailWithError: #{error.localizedDescription}")
    errorAlert = UIAlertView.alloc.initWithTitle("Error", message: "Failed to get Your Location", delegate: nil, cancelButtonTitle: "OK", otherButtonTitles: nil)
    errorAlert.show
  end

  def locationManager(manager, didUpdateLocations: locations)
    @latitude =  (locations.lastObject.coordinate.latitude).to_s
    @longitude = (locations.lastObject.coordinate.longitude).to_s
  end
  
  def messageComposeViewController(controller, didFinishWithResult: result)
    case result
    when MessageComposeResultCancelled
      NSLog("cancelled")
    when MessageComposeResultFailed
      alert = UIAlertView.alloc.initWithTitle("Alert", message: "message compose error", delegate: nil, cancelButtonTitle: "Ok", otherButtonTitles: nil)
      alert.show
    when MessageComposeResultSent
      alert = UIAlertView.alloc.initWithTitle("Alert", message: "message sent successfully", delegate: nil, cancelButtonTitle: "Ok", otherButtonTitles: nil)
      alert.show
    end
    controller.dismissViewControllerAnimated(true, completion: nil)
  end
  
  def device_status
    self.navigationController.pushViewController(DeviceStatus.new, animated: true)
  end
  
end
