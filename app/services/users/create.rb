class Users::Create
  def initialize(params)
    @name = params['name']
    @age = params['age']
    @gender = params['gender']
    @lat = params['lat']
    @lng = params['lng']
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
