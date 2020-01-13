class Api::V1::ForecastController < ApplicationController

  def index
    google_service = GoogleGeoService.new(params['location'])
    lat_long = google_service.coordnates
    location_info = google_service.city_state_country

    darksky_service = DarkskyService.new(lat_long)
    binding.pry
  end

end
