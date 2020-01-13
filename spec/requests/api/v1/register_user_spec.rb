require 'rails_helper'

RSpec.describe Api::V1::UsersController, :type => :controller do
  describe 'register user endpoint' do
    it 'recieves user info and responds with an api key' do
      body = {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "password",
      }

      post :create, body: body.to_json
      api_key_response = JSON.parse(response.body)

      expect(api_key_response).to be_a Hash
      expect(api_key_response).to have_key 'api_key'
    end
  end
end
