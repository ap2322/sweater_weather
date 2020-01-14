class Weather

  def initialize(location)
    @location = location
    @location_info = google_location_info
    @lat_long = google_lat_long
    @current_full_forecast = darksky_current_full_forecast(lat_long)
    @evening = darksky_evening_forecast(lat_long)
  end

  def summary
    {
      location: location_info[:location],
      country: location_info[:country],
      time: make_time(Time.at(current_full_forecast[:currently][:time])),
      date: make_date(Time.at(current_full_forecast[:currently][:time])),
      temperature: current_full_forecast[:currently][:temperature],
      temperature_high: current_full_forecast[:daily][:data][0][:temperatureHigh],
      temperature_low: current_full_forecast[:daily][:data][0][:temperatureLow],
      summary: current_full_forecast[:currently][:summary],
      icon: current_full_forecast[:currently][:icon],
    }
  end

  def details
    {
      icon: current_full_forecast[:daily][:data][0][:icon],
      today_details: current_full_forecast[:daily][:data][0][:summary],
      tonight_details: evening[:currently][:summary],
      feels_like: current_full_forecast[:currently][:apparentTemperature],
      humidity: current_full_forecast[:currently][:humidity],
      visibility_miles: current_full_forecast[:currently][:visibility],
      uv_index: current_full_forecast[:currently][:uvIndex],
      uv_index_relative: uv_relative(current_full_forecast[:currently][:uvIndex]),
    }
  end

  def five_day_forecast
    five_day = {
      hourly_data: [],
      daily_data: []
    }
    make_hourly(five_day)
    make_daily(five_day)
    five_day
  end

  private
  attr_reader :location_info, :location, :lat_long, :current_full_forecast, :evening

  def google_location_info
    @_google_service ||= GoogleGeoService.new(location)
    @_google_service.city_state_country
  end

  def google_lat_long
    @_google_service ||= GoogleGeoService.new(location)
    @_google_service.coordinates
  end

  def darksky_current_full_forecast(lat_long)
    @_darksky_service ||= DarkskyService.new(lat_long)
    current_full_forecast = @_darksky_service.forecast
  end

  def darksky_evening_forecast(lat_long)
    @_darksky_service ||= DarkskyService.new(lat_long)
    evening_forecast = @_darksky_service.evening_forecast
  end

  def make_time(time)
    time.strftime("%l:%M%p")
  end

  def make_date(time)
    time.strftime("%e/%-m")
  end

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

  def make_hourly(five_day)
    next_hours = current_full_forecast[:hourly][:data][0..5]
    next_hours.each do |hour_info|
      five_day[:hourly_data].push({
        time: Time.at(hour_info[:time]).strftime("%l"),
        temperature: hour_info[:temperature]
        })
    end
  end

  def make_daily(five_day)
    next_five_days = current_full_forecast[:daily][:data][1..5]
    next_five_days.each do |daily_info|
      five_day[:daily_data].push({
        day: Time.at(daily_info[:time]).strftime("%A"),
        icon: daily_info[:icon],
        precip_probability: daily_info[:precipProbability],
        precip_type: daily_info[:precipType],
        temp_high: daily_info[:temperatureMax],
        temp_low: daily_info[:temperatureMin],
        })
    end
  end

end
