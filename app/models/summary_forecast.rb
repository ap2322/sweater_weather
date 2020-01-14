class SummaryForecast
  attr_reader :summary, :current_temperature
  def initialize(full_forecast)
    @summary = full_forecast[:currently][:summary]
    @current_temperature = full_forecast[:currently][:temperature]
  end
end
