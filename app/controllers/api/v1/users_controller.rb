class Api::V1::UsersController < ApplicationController

  def create
    user = User.create(user_registration_info)
    if user.save
      api_key = UserSerializer.new(user).serialized_json
      render json: api_key, status: 201
    else
      binding.pry
      error = user.full_messages
      render error, status: 406
    end
  end

  private
  def user_registration_info
    binding.pry
    JSON.parse(params, symbolize_names: true)
  end

end
