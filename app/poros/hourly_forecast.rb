class HourlyForecast
  attr_reader :hourly_data

  def initialize(forecast, hours)
    @hourly_data = make_hourly_data(forecast, hours)
  end

  private

  def make_hourly_data(forecast, hours)
    next_hours = forecast[:hourly][:data][0..hours]
    next_hours.map do |hour_info|
      {
        time: Time.at(hour_info[:time]).strftime("%l %p"),
        temperature: hour_info[:temperature]
      }
    end
  end
end
# next_hours = current_full_forecast[:hourly][:data][0..5]
# next_hours.map do |hour_info|
#   {
#     time: Time.at(hour_info[:time]).strftime("%l %p"),
#     temperature: hour_info[:temperature]
#   }
# end
