class WeatherSummary
  attr_reader :location,
              :country,
              :time,
              :date,
              :temperature,
              :temperature_high,
              :temperature_low,
              :summary,
              :icon

  def initialize(location_info, time, current_full_forecast)
    @location = location_info[:location]
    @country = location_info[:country]
    @time = make_time(time)
    @date = make_date(time)
    @temperature = current_full_forecast[:currently][:temperature]
    @temperature_high = current_full_forecast[:daily][:data][0][:temperatureHigh]
    @temperature_low = current_full_forecast[:daily][:data][0][:temperatureLow]
    @summary = current_full_forecast[:currently][:summary]
    @icon = current_full_forecast[:currently][:icon]
  end

  def make_time(time)
    time.strftime("%l:%M %p")
  end

  def make_date(time)
    time.strftime("%-m/%e")
  end
end


# {
#   location: location_info[:location],
#   country: location_info[:country],
#   time: make_time(Time.at(current_full_forecast[:currently][:time])),
#   date: make_date(Time.at(current_full_forecast[:currently][:time])),
#   temperature: current_full_forecast[:currently][:temperature],
#   temperature_high: current_full_forecast[:daily][:data][0][:temperatureHigh],
#   temperature_low: current_full_forecast[:daily][:data][0][:temperatureLow],
#   summary: current_full_forecast[:currently][:summary],
#   icon: current_full_forecast[:currently][:icon],
# }
