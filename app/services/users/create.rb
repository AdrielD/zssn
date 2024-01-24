class Users::Create
  def initialize(params)
    @name = params['name']
    @age = params['age'].to_i
    @gender = params['gender']
    @lat = params['lat'].to_d
    @lng = params['lng'].to_d
  end

  def perform
    User.create(
      name: @name,
      age: @age,
      gender: @gender,
      lat: @lat,
      lng: @lng
    )
  end
end
