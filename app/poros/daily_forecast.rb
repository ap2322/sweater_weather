class DailyForecast
  attr_reader :daily_data

  def initialize(forecast, days)
    @daily_data = make_daily_data(forecast, days)
  end

  def make_daily_data(forecast, days)
    next_days = forecast[:daily][:data][1..days]
    next_days.map do |daily_info|
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
end
