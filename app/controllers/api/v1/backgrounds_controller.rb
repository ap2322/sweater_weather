class Api::V1::BackgroundsController < ApplicationController

  def index
    background = Background.new(params[:location])
    background_serialized = BackgroundImageSerializer.new(background)
    render json: background_serialized
  end

end
