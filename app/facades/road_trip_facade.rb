class RoadTripFacade
  attr_reader :origin,
              :destination,
              :travel_time,
              :arrival_forecast,
              :id

  def initialize(info)
    @origin = info[:origin]
    @destination = info[:destination]
    @travel_time = fetch_travel_time
    @arrival_forecast = fetch_arrival_forecast
    @id = 1
  end

  def fetch_travel_time
    service = GoogleDirectionsService.new(origin, destination)
    @_directions_info ||= service.directions
    @_directions_info[:routes][0][:legs][0][:duration][:text]
  end

  def fetch_arrival_forecast
    service = DarkskyService.new(destination_lat_long)
    forecast_info = service.specific_forecast(destination_lat_long, destination_time, destination_time.hour)
    RoadTripForecast.new(forecast_info[:currently])
  end

  private

  def destination_lat_long
    @_directions_info[:routes][0][:legs][0][:end_location].values.join(',')
  end

  def destination_time
    Time.now + @_directions_info[:routes][0][:legs][0][:duration][:value]
  end

end
