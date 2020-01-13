class AmypodeService

  def self.antipode(lat_long)
    json_response = fetch_json_response(lat_long)
    anti_lat = json_response[:data][:attributes][:lat]
    anti_long = json_response[:data][:attributes][:long]
    "#{anti_lat},#{anti_long}"
  end

  private

  def self.fetch_json_response(lat_long)
    response = Faraday.get('http://amypode.herokuapp.com/api/v1/antipodes') do |req|
      req.params['lat'] = lat_long.split(',')[0]
      req.params['long'] = lat_long.split(',')[1]
      req.headers['api_key'] = ENV['AMYPODE_API_KEY']
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
