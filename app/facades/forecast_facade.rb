class ForecastFacade
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def forecast_as_json
    weather = Weather.new(location)
    all_details = {
      summary: weather.summary,
      details: weather.details,
      five_day_forecast: weather.five_day_forecast,
    }
    JSON.generate(all_details)
  end

end
