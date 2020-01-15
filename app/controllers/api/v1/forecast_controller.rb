class Api::V1::ForecastController < ApplicationController

  def index
    forecast = ForecastFacade.new(params['location'])
    forecast_response = ForecastSerializer.new(forecast)

    render json: forecast_response
  end

end
