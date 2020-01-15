class Forecast
  attr_reader :hourly, :daily

  def initialize(lat_long, current_full_forecast)
    @lat_long = lat_long
    @hourly = make_hourly_forecast(current_full_forecast)
    @daily = get_five_day_forecast(current_full_forecast)
  end

  def make_hourly_forecast(current_full_forecast)
    hours = 7
    HourlyForecast.new(current_full_forecast, hours)
  end

  def get_five_day_forecast(current_full_forecast)
    days = 5
    DailyForecast.new(current_full_forecast, days)
  end

  private
  attr_reader :lat_long, :time

end
