class Users::Locate
  def initialize(params)
    @id = params[:id].to_i
    @lat = params[:lat].to_d unless params[:address].present?
    @lng = params[:lng].to_d unless params[:address].present?
    @address = params[:address]
  end

  def perform
    user = User.find(@id)

    if (@address.present?)
      geocoder = Geocoder.new
      geocoder.search(@address)
      @lat = geocoder.get_coords[:lat]
      @lng = geocoder.get_coords[:lng]
    end

    user.update!(lat: @lat, lng: @lng)
    user
  end
end
