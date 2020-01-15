class Weather
  attr_reader :lat_long,
              :summary,
              :details

  def initialize(location, lat_long, google_location_info, current_forecast, evening_forecast)
    @location = location
    # @location_info = google_location_info
    @lat_long = lat_long
    # @current_full_forecast = darksky_current_full_forecast(lat_long)
    # @evening = darksky_evening_forecast(lat_long)
    @summary = make_summary(current_forecast, google_location_info)
    @details = make_details(current_forecast, evening_forecast)
  end

  def make_summary(current_full_forecast, location_info)
    time = Time.at(current_full_forecast[:currently][:time])
    WeatherSummary.new(location_info, time, current_full_forecast)
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
  end

  def make_details(current_full_forecast, evening_forecast)
    WeatherDetails.new(current_full_forecast, evening_forecast)
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

  private
  attr_reader

  # def google_location_info
  #   google_service = GoogleGeoService.new(location)
  #   @_geo_info ||= google_service.get_geographic_info
  #   location_name_hash(@_geo_info)
  # end

  # def location_name_hash(json_info)
  #   city = json_info[:results][0][:address_components][0][:long_name]
  #   state = json_info[:results][0][:address_components][2][:short_name]
  #   country = json_info[:results][0][:address_components][3][:long_name]
  #   {location: "#{city}, #{state}", country: country}
  # end

  # def google_lat_long
  #   @_geo_info[:results][0][:geometry][:location].values.join(',')
  # end
  # 
  # def darksky_current_full_forecast(lat_long)
  #   @_darksky_service ||= DarkskyService.new(lat_long)
  #   current_full_forecast = @_darksky_service.forecast
  # end
  #
  # def darksky_evening_forecast(lat_long)
  #   @_darksky_service ||= DarkskyService.new(lat_long)
  #   evening_forecast = @_darksky_service.specific_forecast
  # end

  # def make_time(time)
  #   time.strftime("%l:%M%p")
  # end
  #
  # def make_date(time)
  #   time.strftime("%e/%-m")
  # end

  # def uv_relative(uv_index)
  #   if uv_index <= 2
  #     return 'low'
  #   elsif uv_index > 2 && uv_index <= 5
  #     return 'moderate'
  #   elsif uv_index > 5 && uv_index <=7
  #     return 'high'
  #   elsif uv_index > 7 && uv_index <= 10
  #     return 'very high'
  #   elsif uv_index > 10
  #     return 'extreme'
  #   end
  # end

end
