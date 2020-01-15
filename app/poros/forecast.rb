class Forecast
  attr_reader :hourly, :daily

  def initialize(lat_long, current_full_forecast)
    @lat_long = lat_long
    @hourly = make_hourly_forecast(current_full_forecast)
    @daily = get_five_day_forecast(current_full_forecast)
  end

  def make_hourly_forecast(current_full_forecast)
    # @_current_full_forecast ||= darksky_current_full_forecast(lat_long)
    hours = 7
    HourlyForecast.new(current_full_forecast, hours)
    # next_hours = current_full_forecast[:hourly][:data][0..5]
    # next_hours.map do |hour_info|
    #   {
    #     time: Time.at(hour_info[:time]).strftime("%l %p"),
    #     temperature: hour_info[:temperature]
    #   }
    # end
  end

  def get_five_day_forecast(current_full_forecast)
    days = 5
    DailyForecast.new(current_full_forecast, days)
    # next_five_days = current_full_forecast[:daily][:data][1..5]
    # next_five_days.map do |daily_info|
    #   {
    #     day: Time.at(daily_info[:time]).strftime("%A"),
    #     icon: daily_info[:icon],
    #     precip_probability: daily_info[:precipProbability],
    #     precip_type: daily_info[:precipType],
    #     temp_high: daily_info[:temperatureMax],
    #     temp_low: daily_info[:temperatureMin],
    #   }
    # end
  end

  private
  attr_reader :lat_long, :time

end
