class RoadTripForecast
  attr_reader :temperature, :summary

  def initialize(info)
    @temperature = info[:temperature]
    @summary = info[:summary]
  end
end
