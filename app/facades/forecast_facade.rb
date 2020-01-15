require 'tzinfo'

class ForecastFacade
  attr_reader :location,
              :summary,
              :details,
              :forecast,
              :id

  def initialize(location)
    @location = location
    @location_info = google_location_info
    @lat_long = google_lat_long
    @current_forecast = darksky_current_full_forecast(lat_long)
    @evening_forecast = darksky_evening_forecast(lat_long)
    @weather = make_weather
    @forecast = make_forecast
    @summary = weather.summary
    @details = weather.details
    @id = 1
  end

  def make_weather
    Weather.new(location, lat_long, location_info, current_forecast, evening_forecast)
  end

  def make_forecast
    Forecast.new(weather.lat_long, current_forecast)
  end

  private
  attr_reader :weather,
              :forecast_aggregator,
              :lat_long,
              :location_info,
              :current_forecast,
              :evening_forecast

  def location_name_hash(json_info)
    city = json_info[:results][0][:address_components][0][:long_name]
    state = json_info[:results][0][:address_components][2][:short_name]
    country = json_info[:results][0][:address_components][3][:long_name]
    {location: "#{city}, #{state}", country: country}
  end

  def google_location_info
    google_service = GoogleGeoService.new(location)
    @_geo_info ||= google_service.get_geographic_info
    location_name_hash(@_geo_info)
  end

  def google_lat_long
    @_geo_info[:results][0][:geometry][:location].values.join(',')
  end

  def darksky_current_full_forecast(lat_long)
    @_darksky_service ||= DarkskyService.new(lat_long)
    current_full_forecast = @_darksky_service.forecast
  end

  def darksky_evening_forecast(lat_long)
    hours = 22
    time = local_time(current_forecast[:currently][:time], current_forecast[:timezone])
    evening_forecast = @_darksky_service.specific_forecast(lat_long, time, hours)
    binding.pry
  end

  def local_time(forecast_time, forecast_timezone)
    tz = TZInfo::Timezone.get(forecast_timezone)
    machine_time = Time.at(forecast_time)
    tz.utc_to_local(machine_time.utc)
  end
end
