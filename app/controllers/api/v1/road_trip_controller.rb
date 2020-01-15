class Api::V1::RoadTripController < ApplicationController
  before_action :authenticate

  def create
    road_trip = RoadTripFacade.new(road_trip_info)

    # serialize info from RoadTripFacade
    # render json and status code
  end

  private

  def authenticate
    user = User.find_by(api_key: params[:api_key])
    if user.nil?
      render json: error, status: 401
    end
  end

  def road_trip_info
    params.permit(:origin, :destination)
  end

  def error
    { error: 'Unauthorized request' }
  end

end
