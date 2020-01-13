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
    full_forecast = {}
    if antipode_location_name == "Sorry, no places found for those coordinates"
      return full_forecast = {
        currently: {
          summary: 'No location for forecast',
          temperature: 'No location for forecast',
        }
      }
    else
      darksky_service = DarkskyService.new(antipode_coordinates)
      darksky_service.forecast
    end
  end

  private
  attr_reader :search_coordinates, :antipode_coordinates
end
