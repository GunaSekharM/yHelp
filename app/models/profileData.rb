class Profile_data < CDQManagedObject
  def self.create_or_update(*params)
    Profile_data.create(fullName: params[0], age: params[1], gender: params[2], message: params[3], phone_number1: params[4], phone_number2: params[5], phone_number3: params[6], phone_number4: params[7], phone_number5: params[8])
    cdq.save
    @array = Profile_data.array
  end
  
  def self.data
    @array = Profile_data.array
    @array
  end
end