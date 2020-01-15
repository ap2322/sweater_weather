class DarkskyService
  def initialize(lat_long)
    @lat_long = lat_long
  end

  def forecast
    response = conn.get(lat_long)
    JSON.parse(response.body, symbolize_names: true)
  end

  def specific_forecast(location = lat_long, time = Time.now, hours = 22)
    specific_time = Time.new(time.year, time.month, time.day, hours).to_i.to_s
    response = conn.get("#{location},#{specific_time}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  attr_reader :lat_long
  def conn
    Faraday.new(
      url: "https://api.darksky.net/forecast/#{ENV['DARKSKY_API_KEY']}",
      params: {units: 'us'}
    )
  end
end
