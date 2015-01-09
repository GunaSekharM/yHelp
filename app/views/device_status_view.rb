class DeviceStatusView < UIView
  def rmq_build
    q = rmq(self)
    q.apply_style :root_view
    rmq.append(UILabel, :device_label)
    rmq.append(UILabel, :gps_label)
    rmq.append(UILabel, :latitude_label)
    rmq.append(UILabel, :latitude_value).tag(:latitude_value)
    rmq.append(UILabel, :longitude_label)
    rmq.append(UILabel, :longitude_value).tag(:longitude_value)
    rmq.append(UILabel, :battery_label)
    rmq.append(UILabel, :battery_label_value).tag(:battery_value)
  end
end