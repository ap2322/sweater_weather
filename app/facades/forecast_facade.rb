class ForecastFacade
  attr_reader :location

  def initialize(location)
    @location = location
    @weather = Weather.new(location)
    @forecast = Forecast.new(weather.lat_long)
  end

  def forecast_as_json
    all_details = {
      summary: weather.summary,
      details: weather.details,
      five_day_forecast: forecast.five_day_and_hourly,
    }
    JSON.generate(all_details)
  end

  private
  attr_reader :weather, :forecast

end
