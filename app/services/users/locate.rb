class Users::Locate
  def initialize(params)
    @id = params['id']
    @lat = params['lat']
    @lng = params['lng']
  end

  def perform
    user = User.find(@id)
    user.update(lat: @lat, lng: @lng)
  end
end
