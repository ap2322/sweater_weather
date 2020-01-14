class Api::V1::UsersController < ApplicationController

  def create
    user = User.create(user_registration)
    if user.save
      api_key = { api_key: user.api_key }
      render json: api_key, status: 201
    else
      binding.pry
      error = user.full_messages
      render error, status: 406
    end
  end

  private
  def user_registration
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
