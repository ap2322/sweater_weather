class AmypodeService

  def self.antipode(lat_long)
    ll_array = lat_long.split(',')
    lat = ll_array[0]
    long = ll_array[1]
    response = Faraday.get('http://amypode.herokuapp.com/api/v1/antipodes') do |req|
      req.params['lat'] = lat
      req.params['long'] = long
      req.headers['api_key'] = ENV['AMYPODE_API_KEY']
    end
    json_response = JSON.parse(response.body, symbolize_names: true)
    anti_lat = json_response[:data][:attributes][:lat]
    anti_long = json_response[:data][:attributes][:long]
    "#{anti_lat},#{anti_long}"
  end

end
