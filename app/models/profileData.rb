class ProfileData < CDQManagedObject
  def self.create_or_update(*params)
    ProfileData.create(fullName: params[0], age: params[1], gender: params[2], message: params[3], phone_number1: params[4], phone_number2: params[5], phone_number3: params[6], phone_number4: params[7], phone_number5: params[8])
    cdq.save
  end
  
  def self.data
    ProfileData.array
  end
end