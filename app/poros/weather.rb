require 'tzinfo'

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
    time = get_local_time(current_full_forecast[:timezone],
                          current_full_forecast[:currently][:time])
    WeatherSummary.new(location_info, time, current_full_forecast)
  end

  def make_details(current_full_forecast, evening_forecast)
    WeatherDetails.new(current_full_forecast, evening_forecast)
  end

  private

  def get_local_time(timezone, current_time)
    tz = TZInfo::Timezone.get(timezone)
    machine_time = Time.at(current_time)
    tz.utc_to_local(machine_time.utc)
  end

end
