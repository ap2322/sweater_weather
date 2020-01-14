class Api::V1::AntipodeController < ApplicationController

  def show
    antipode_info = AntipodeFacade.new(params[:location])
    hash_output = AntipodeForecastSerializer.new(antipode_info)

    render json: hash_output
  end

end
