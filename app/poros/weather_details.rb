class WeatherDetails
  attr_reader :icon,
              :summary,
              :today_details,
              :tonight_details,
              :feels_like,
              :humidity,
              :visibility_miles,
              :uv_index,
              :uv_index_relative

  def initialize(current_full_forecast, evening_forecast)
    @icon = current_full_forecast[:daily][:data][0][:icon]
    @summary = current_full_forecast[:currently][:summary]
    @today_details = current_full_forecast[:daily][:data][0][:summary]
    @tonight_details = evening_forecast[:currently][:summary]
    @feels_like = current_full_forecast[:currently][:apparentTemperature]
    @humidity = current_full_forecast[:currently][:humidity]
    @visibility_miles = current_full_forecast[:currently][:visibility]
    @uv_index = current_full_forecast[:currently][:uvIndex]
    @uv_index_relative = uv_relative(current_full_forecast[:currently][:uvIndex])
  end

  private
  def uv_relative(uv_index)
    if uv_index <= 2
      return 'low'
    elsif uv_index > 2 && uv_index <= 5
      return 'moderate'
    elsif uv_index > 5 && uv_index <=7
      return 'high'
    elsif uv_index > 7 && uv_index <= 10
      return 'very high'
    elsif uv_index > 10
      return 'extreme'
    end
  end

  # {
  #   icon: current_full_forecast[:daily][:data][0][:icon],
  #   today_details: current_full_forecast[:daily][:data][0][:summary],
  #   tonight_details: evening[:currently][:summary],
  #   feels_like: current_full_forecast[:currently][:apparentTemperature],
  #   humidity: current_full_forecast[:currently][:humidity],
  #   visibility_miles: current_full_forecast[:currently][:visibility],
  #   uv_index: current_full_forecast[:currently][:uvIndex],
  #   uv_index_relative: uv_relative(current_full_forecast[:currently][:uvIndex]),
  # }
end
