class RoadTripFacade
  attr_reader :origin,
              :destination,
              :travel_time,
              :arrival_forecast

  def initialize(info)
    @origin = info[:origin]
    @destination = info[:destination]
    @travel_time = fetch_travel_time
    @arrival_forecast = get_arrival_forecast
  end

  def fetch_travel_time
    # google directions service call and parse for travel time
  end



  # expect(road_trip_info).to have_key :origin
  # expect(road_trip_info).to have_key :destination
  # expect(road_trip_info).to have_key :travel_time
  # expect(road_trip_info).to have_key :arrival_forecast
  # expect(road_trip_info).to have_key :temperature (part of arrival forecast)
  # expect(road_trip_info).to have_key :summary (part of arrival forecast)
end
