class MainView < UIView
  def rmq_build
    q = rmq(self)
    q.apply_style :root_view
    q.append(UIButton, :profile_label).on(:touch_up_inside){|sender| controller.profile(sender) }
    q.append(UIButton, :send_sms_label).on(:touch_up_inside){|sender| controller.send_sms(sender) }
    q.append(UIButton, :Device_label).on(:touch_up_inside) {|sender| controller.device_status(sender) }
  end
  
  def controller
    @controller ||= self.rmq_data.view_controller
  end
end
    