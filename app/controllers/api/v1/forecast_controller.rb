class Api::V1::ForecastController < ApplicationController

  def index
    forecast = ForecastFacade.new(params['location'])
    render json: forecast.forecast_hash
  end

end
