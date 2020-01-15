class Forecast
  attr_reader :hourly, :five_days

  def initialize(lat_long, time = Time.now)
    @lat_long = lat_long
    @time = time
    @current_full_forecast = darksky_current_full_forecast(lat_long)
    @hourly = get_hourly_forecast
    @five_days = get_five_day_forecast
  end

  def get_hourly_forecast
    next_hours = current_full_forecast[:hourly][:data][0..5]
    next_hours.map do |hour_info|
      {
        time: Time.at(hour_info[:time]).strftime("%l %p"),
        temperature: hour_info[:temperature]
      }
    end
  end

  def get_five_day_forecast
    next_five_days = current_full_forecast[:daily][:data][1..5]
    next_five_days.map do |daily_info|
      {
        day: Time.at(daily_info[:time]).strftime("%A"),
        icon: daily_info[:icon],
        precip_probability: daily_info[:precipProbability],
        precip_type: daily_info[:precipType],
        temp_high: daily_info[:temperatureMax],
        temp_low: daily_info[:temperatureMin],
      }
    end
  end

  def five_day_and_hourly
    {
      hourly_data: hourly,
      daily_data: five_days,
    }
  end

  private
  attr_reader :lat_long, :time, :current_full_forecast

  def darksky_current_full_forecast(lat_long)
    @_darksky_service ||= DarkskyService.new(lat_long)
    @_darksky_service.forecast
  end

end
