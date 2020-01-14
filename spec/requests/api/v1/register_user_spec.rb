require 'rails_helper'

RSpec.describe 'Register User API', :type => :request do
  describe 'register user endpoint' do
    it 'recieves user info and responds with an api key' do
      User.destroy_all
      body = {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "password",
      }

      post '/api/v1/users', params: {user: body}

      api_key_response = JSON.parse(response.body)

      expect(api_key_response).to be_a Hash
      expect(api_key_response).to have_key 'api_key'
    end
  end
end
