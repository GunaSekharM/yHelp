class DeviceStatusView < UIView
  def rmq_build
    q = rmq(self)
    q.apply_style :root_view
    device_status_label = rmq.append(UILabel, :device_label).get
    device_status_label.textAlignment = NSTextAlignmentCenter
    
    rmq.append(UILabel, :gps_label)
    rmq.append(UILabel, :latitude_label)
    rmq.append(UILabel, :latitude_value).tag(:latitude_value)
    rmq.append(UILabel, :longitude_label)
    rmq.append(UILabel, :longitude_value).tag(:longitude_value)
    rmq.append(UILabel, :battery_label)
    battery_label = rmq.append(UILabel, :battery_label_value).tag(:battery_value).get
    battery_label.textAlignment = NSTextAlignmentCenter
    
    
    
    #latitude_label.text, longitude_label.text = MainController.lat_long
  end
end