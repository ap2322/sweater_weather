class GoogleDirectionsService
  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def directions
    response = conn.get('directions/json') do |req|
      req.params['origin'] = origin
      req.params['destination'] = destination
      req.params['language'] = 'en'
      req.params['units'] = 'imperial'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  attr_reader :origin, :destination

  def conn
    Faraday.new(url: 'https://maps.googleapis.com/maps/api/') do |f|
      f.adapter Faraday.default_adapter
      f.params[:key] = ENV['GOOGLE_API_KEY']
    end
  end
end
