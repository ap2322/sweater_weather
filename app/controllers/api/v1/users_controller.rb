class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_registration)
    if user.save
      api_key = { api_key: user.api_key }
      render json: api_key, status: 201
    else
      error = { errors: user.errors.full_messages }
      render json: error, status: 400
    end
  end

  private
  def user_registration
    params.permit(:email, :password, :password_confirmation)
  end

end
