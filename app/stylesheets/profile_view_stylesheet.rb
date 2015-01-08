module ProfileViewStylesheet
  def heading(st)
    st.frame = {t: 100, l: 30, w: 320, h: 40}
    st.text = "Fill your GetHelp Profile"
    st.font = font.system(25)
    st.color = color.white
  end
  
  def full_name(st)
    st.frame = {t: 150, l: 20, w: 270, h: 30}
    st.background_color = color.white
    st.placeholder = " Full Name "
    st.corner_radius = 5
    st.view.keyboardType = UIKeyboardTypeAlphabet
  end
  
  def age(st)
    st.frame = {t: 190, l: 20, w: 270, h: 30}
    st.background_color = color.white
    st.corner_radius = 5
    st.placeholder = " Age "
    st.view.keyboardType = UIKeyboardTypeNumberPad
  end
  
  def gender(st)
    st.frame = {t: 230, l: 20, w: 270, h: 30}
    st.background_color = color.white
    st.corner_radius = 5
    st.placeholder = " gender "
    st.view.keyboardType = UIKeyboardTypeAlphabet
  end
  
  def sos(st)
    st.frame = {t: 270, l: 20, w: 270, h: 30}
    st.background_color = color.from_hex("FFDB4C")
    st.corner_radius = 5
    st.placeholder = " SOS Message "
    st.view.keyboardType = UIKeyboardTypeAlphabet
    st.text_color = color.red
  end
  
  def ph_no1(st)
    st.frame = {t: 310, l: 20, w: 200, h: 30}
    st.background_color = color.white
    st.corner_radius = 5
    st.placeholder = " PhoneNumber "
    st.view.keyboardType = UIKeyboardTypeNumberPad
  end  
  
  def add_button(st)
    st.frame = {t: 318, l: 240, w: 20, h: 20}
    st.text = "+"
  end
end