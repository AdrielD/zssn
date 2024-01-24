class Users::Create
  def initialize(params)
    @name = params['name']
    @age = params['age'].to_i
    @gender = params['gender']
    @lat = params['lat'].to_d
    @lng = params['lng'].to_d
  end

  def perform
    user = User.create(
      name: @name,
      age: @age,
      gender: @gender,
      lat: @lat,
      lng: @lng
    )

    raise StandardError.new(user.errors) if user.errors.any?
    user
  end
end
