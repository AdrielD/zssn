class Users::Locate
  def initialize(params)
    @id = params['id'].to_i
    @lat = params['lat'].to_d
    @lng = params['lng'].to_d
  end

  def perform
    user = User.find(@id)
    user.update(lat: @lat, lng: @lng)
  end
end
