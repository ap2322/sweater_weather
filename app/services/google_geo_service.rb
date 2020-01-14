class GoogleGeoService
  def initialize(location)
    @location = location
    @response ||= get_response
  end

  def coordinates
    json_info = json_response
    json_info[:results][0][:geometry][:location].values.join(',')
  end

  def city_state_country
    location_name_hash(json_response)
  end

  private
  attr_reader :location, :response

  def get_response
    Faraday.get('https://maps.googleapis.com/maps/api/geocode/json') do |req|
      req.params['address'] = location
      req.params['key'] = ENV['GOOGLE_GEO_API_KEY']
    end
  end

  def json_response
    JSON.parse(response.body, symbolize_names: true)
  end

  def location_name_hash(json_info)
    city = json_info[:results][0][:address_components][0][:long_name]
    state = json_info[:results][0][:address_components][2][:short_name]
    country = json_info[:results][0][:address_components][3][:long_name]
    {location: "#{city}, #{state}", country: country}
  end

end
