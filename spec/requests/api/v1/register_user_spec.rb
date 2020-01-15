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

      post '/api/v1/users', params: body

      api_key_response = JSON.parse(response.body)

      expect(api_key_response).to be_a Hash
      expect(api_key_response).to have_key 'api_key'
      expect(response.status).to eq 201
    end

    it 'does not make a user if missing information' do
      User.destroy_all
      body = {
        "email": "whatever@example.com",
        "password": "password",
      }

      post '/api/v1/users', params: body

      error_response = JSON.parse(response.body)
      expected_error = {"errors"=>["Password confirmation can't be blank"]}
      expect(error_response).to eq expected_error
      expect(response.status).to eq 400
    end

    it 'can return all error responses' do
      new_body = {
        "email": "whatever@example.com",
      }
      post '/api/v1/users', params: new_body

      error_responses = JSON.parse(response.body)
      expected_errors = {"errors"=>["Password can't be blank", "Password confirmation can't be blank"]}
      expect(error_responses).to eq expected_errors
      expect(response.status).to eq 400
    end
  end
end
