class AntipodeForecastSerializer
  def self.serializable_hash(search_location, antipode_location, full_forecast)
    {
      type: 'antipode',
      attributes: {
        location_name: antipode_location,
        forecast: {
          summary: full_forecast[:currently][:summary],
          current_temperature: full_forecast[:currently][:temperature],
        },
        search_location: search_location
      }
    }
  end
end
