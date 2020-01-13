class Api::V1::AntipodeController < ApplicationController

  def show
    antipode_info = AntipodeFacade.new(params[:location])
    hash_output = AntipodeForecastSerializer.serializable_hash(
      params[:location],
      antipode_info.antipode_location_name,
      antipode_info.antipode_forecast)

    render json: hash_output.to_json
  end

end
