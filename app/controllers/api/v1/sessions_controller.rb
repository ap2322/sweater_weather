class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: user_info[:email])
    if user && user.authenticate(user_info[:password])
      api_key = { api_key: user.api_key }
      render json: api_key, status: 200
    else
      render json: error_response, status: 400
    end
  end

  private
  def user_info
    params.require(:user).permit(:email, :password)
  end

  def error_response
    { error: 'credentials are bad' }
  end

end
