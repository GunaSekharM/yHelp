class MainController < UIViewController 

  def viewDidLoad
    super
    self.edgesForExtendedLayout = UIRectEdgeNone
    rmq.stylesheet = MainControllerStylesheet
    self.title = 'GetHelp'
    rmq.append(MainView, :root_view)
    self.navigationController.navigationBar.setBarTintColor(rmq.color.from_hex("1AD6FD"))
    BW::Location.get_once do |result|
      if result.is_a?(CLLocation)
        @latitude = result.coordinate.latitude
        @longitude = result.coordinate.longitude
      end
    end
  end
  
  def self.battery_percentage
    myDevice = UIDevice.currentDevice
    myDevice.setBatteryMonitoringEnabled(true)
    batLeft = myDevice.batteryLevel
  end
  
  def profile
    if ProfileData.data.count < 1
      self.navigationController.pushViewController(ProfileViewController.new, animated: true)
    else
      alert("You already entered details in profile")
    end
  end
  
  def send_sms
    if ProfileData.data.count < 1
      alert("Please fill details to send SMS in profile")
    else
      table_data = ProfileData.data
      bat_left = self.class.battery_percentage
      BW::SMS.compose({delegate: self, to: [table_data[0].phone_number1, table_data[0].phone_number2, table_data[0].phone_number3, table_data[0].phone_number4, table_data[0].phone_number5], message: "My name is #{table_data[0].fullName},\nMy age is #{table_data[0].age},\n i am #{table_data[0].gender},\nand i want to send my following Message: #{table_data[0].message},\nMy Phone Status:,\nBattery charge level: #{(bat_left*100).round.abs.to_s}%,\nMy Gps coordinates:\nLatitude: #{@latitude},\nLongitude: #{@longitude}\nand google map link https://maps.google.com/maps?q=#{@latitude},#{@longitude}", animated: false})
    end
  end
  
  def device_status
    self.navigationController.pushViewController(DeviceStatusController.new, animated: true)
  end
  
  def alert(message)
    App.alert("Alert", {cancel_button_title: "OK", message: message})
  end
end
