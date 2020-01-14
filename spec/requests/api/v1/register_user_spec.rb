require 'rails_helper'

# RSpec.describe 'Register User API', :type => :request do
#   describe 'register user endpoint' do
#     it 'recieves user info and responds with an api key' do
#       body = {
#         "email": "whatever@example.com",
#         "password": "password",
#         "password_confirmation": "password",
#       }
#
#       post '/api/v1/users', params: body
#       api_key_response = JSON.parse(response.body)
#       binding.pry
#
#       expect(api_key_response).to be_a Hash
#       expect(api_key_response).to have_key 'api_key'
#     end
#   end
# end

RSpec.describe Api::V1::UsersController, :type => :controller do
  describe 'register user endpoint' do
    it 'recieves user info and responds with an api key' do
      body = {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "password",
      }

      r = post :create, body: body.to_json
      expect(r.request.env['PATH_INFO']).to eq '/api/v1/users'
      api_key_response = JSON.parse(response.body)

      expect(api_key_response).to be_a Hash
      expect(api_key_response).to have_key 'api_key'
    end
  end
end
