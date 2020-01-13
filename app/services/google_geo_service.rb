class GoogleGeoService
  def initialize(location)
    @location = location
    @response ||= response
  end

  def coordinates
    json_response = JSON.parse(@response.body, symbolize_names: true)
    lat_long = json_response[:results][0][:geometry][:location].values.join(',')
  end

  def city_state_country
    json_response = JSON.parse(@response.body, symbolize_names: true)
    city = json_response[:results][0][:address_components][0][:long_name]
    state = json_response[:results][0][:address_components][2][:short_name]
    country = json_response[:results][0][:address_components][3][:long_name]
    {location: "#{city}, #{state}", country: country}
  end

  def find_place(lat_long)
    resp = conn.get('geocode/json') do |req|
      req.params['latlng'] = lat_long
    end
    json_resp = JSON.parse(resp.body, symbolize_names: true)
    json_resp[:results][-3][:formatted_address]
  end

  private
  attr_reader :location

  def conn
    Faraday.new(
      url: 'https://maps.googleapis.com/maps/api/',
      params: {'key' => ENV['GOOGLE_GEO_API_KEY']}
    )
  end

  def response
    conn.get('geocode/json') do |req|
      req.params['address'] = location
    end
  end

end
