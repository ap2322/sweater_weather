class AntipodeFacade
  attr_reader :location_search,
              :antipode_location_name,
              :forecast,
              :id

  def initialize(location_search)
    @id = 1
    @location_search = location_search
    @search_coordinates = get_coordinates
    @antipode_coordinates = get_antipode_lat_long
    @antipode_location_name = get_antipode_location_name
    @forecast = get_antipode_forecast
  end

  def get_coordinates
    @google_service ||= GoogleGeoService.new(location_search)
    @google_service.coordinates
  end

  def get_antipode_lat_long
    AmypodeService.antipode(search_coordinates)
  end

  def get_antipode_location_name
    @google_service.find_place(antipode_coordinates)
  end

  def get_antipode_forecast
    darksky_service = DarkskyService.new(antipode_coordinates)
    full_forecast = darksky_service.forecast
    SummaryForecast.new(full_forecast)
  end

  private
  attr_reader :search_coordinates, :antipode_coordinates
end
