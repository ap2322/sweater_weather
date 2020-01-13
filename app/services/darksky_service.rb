class DarkskyService
  def initialize(lat_long)
    @lat_long = lat_long
  end

  def forecast
    response = conn.get(lat_long)
    JSON.parse(response.body, symbolize_names: true)
  end

  def evening_forecast
    now = Time.now
    evening_time = Time.new(now.year, now.month, now.day, 22).to_i.to_s
    response = conn.get("#{lat_long},#{evening_time}")
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
