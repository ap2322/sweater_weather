class AntipodeFacade
  attr_reader :location_search,
              :antipode_location_name,
              :antipode_forecast

  def initialize(location_search)
    @location_search = location_search
    @search_coordinates = get_coordinates
    @antipode_coordinates = antipode_lat_long
    @antipode_location_name = get_antipode_location_name
    @antipode_forecast = get_antipode_forecast
  end

  def get_coordinates
    @google_service ||= GoogleGeoService.new(location_search)
    @google_service.coordinates
  end

  def antipode_lat_long
    AmypodeService.antipode(search_coordinates)
  end

  def get_antipode_location_name
    @google_service ||= GoogleGeoService.new(location_search)
    @google_service.find_place(antipode_coordinates)
  end

  def get_antipode_forecast
    darksky_service = DarkskyService.new(antipode_coordinates)
    darksky_service.forecast
  end

  private
  attr_reader :location_search, :search_coordinates, :antipode_coordinates
end
