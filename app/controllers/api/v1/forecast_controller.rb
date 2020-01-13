class Api::V1::ForecastController < ApplicationController

  def index
    forecast = ForecastFacade.new(params['location'])
    render json: forecast.forecast_as_json
  end

end
