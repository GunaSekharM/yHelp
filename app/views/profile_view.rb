class ProfileView < UIView
  def rmq_build
    q = rmq(self)
    q.apply_style :root_view
    rmq.append(UILabel, :heading)
    rmq.append(UITextField, :full_name).tag(:full_name_text)
    age_text = rmq.append(UITextField, :age).tag(:age_text)
    gender_text = rmq.append(UITextField, :gender).tag(:gender_text)
    sos_text = rmq.append(UITextField, :sos).tag(:sos_text)
    phone_number_text = rmq.append(UITextField, :ph_no1).tag(:phone_number_text)
    rmq.append(UIButton, :add_button).on(:tap) {controller.add_phone}
  end
  
  def controller
    @controller ||= self.rmq_data.view_controller
  end
end