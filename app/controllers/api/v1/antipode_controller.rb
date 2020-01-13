class Api::V1::AntipodeController < ApplicationController

  def show
    # get lat and long of search
    google_service = GoogleGeoService.new(params[:location])
    search_lat_long = google_service.coordinates

    # send lat and long of search to amy pode api for antipode
    antipode_lat_long = AmypodeService.antipode(search_lat_long)

    # send antipode lat and long to google geocode api for city name
    antipode_location_name = google_service.find_place(antipode_lat_long)

    # send antipode lat and long to darksky api for current weather summary and temp
  end

end
