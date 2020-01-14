class AntipodeForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location_search, :antipode_location_name, :forecast
  # def initialize(antipode_facade)
  #   @search_location = antipode_facade.location_search
  #   @location_name = antipode_facade.antipode_location_name
  #   @forecast_summary = antipode_facade.antipode_forecast[:currently][:summary]
  #   @forecast_temperature = antipode_facade.antipode_forecast[:currently][:temperature]
  # end
  #
  # def serializable_hash(antipode)
  #   {
  #     type: 'antipode',
  #     attributes: {
  #       location_name: antipode_location,
  #       forecast: {
  #         summary: full_forecast[:currently][:summary],
  #         current_temperature: full_forecast[:currently][:temperature],
  #       },
  #       search_location: search_location
  #     }
  #   }
  # end
end
