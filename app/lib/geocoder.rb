class Geocoder
  API_URL = 'https://maps.googleapis.com/maps/api/geocode/json'
  API_KEY = 'AIzaSyCVF1qbdAHBS7W0xj2TnA9xDNlQrZeLiSI'

  def initialize
    @geo = {}
    @connection = Faraday.new(
      url: API_URL,
      params: { key: API_KEY },
      headers: {'Content-Type' => 'application/json'}
    )
  end

  def search(address)
    result = @connection.get('', { address: address })
    @geo = JSON.parse(result.body).with_indifferent_access
  end

  def get_coords
    @geo[:results].first[:geometry][:location]
  end
end
