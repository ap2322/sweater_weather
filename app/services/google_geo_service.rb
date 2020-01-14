class GoogleGeoService
  def initialize(location)
    @location = location
  end

  def get_geographic_info
    response = Faraday.get('https://maps.googleapis.com/maps/api/geocode/json') do |req|
      req.params['address'] = location
      req.params['key'] = ENV['GOOGLE_GEO_API_KEY']
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  attr_reader :location

end
