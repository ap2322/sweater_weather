class ForecastFacade
  attr_reader :location,
              :summary,
              :details,
              :forecast,
              :id

  def initialize(location)
    @location = location
    @weather = Weather.new(location)
    @forecast_aggregator = Forecast.new(weather.lat_long)
    @summary = weather.summary
    @details = weather.details
    @forecast = forecast_aggregator.five_day_and_hourly
    @id = 1
  end

  # def forecast_hash
  #   {
  #     summary: weather.summary,
  #     details: weather.details,
  #     five_day_forecast: forecast.five_day_and_hourly,
  #   }
  # end

  private
  attr_reader :weather, :forecast_aggregator

end
