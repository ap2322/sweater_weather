class Api::V1::AntipodeController < ApplicationController

  def show
    # get lat and long of search
    google_service = GoogleGeoService.new(params[:location])
    search_lat_long = google_service.coordinates

    # send lat and long of search to amy pode api for antipode
    

    # send antipode lat and long to google geocode api for city name

    # send antipode lat and long to darksky api for current weather summary and temp
  end

end
