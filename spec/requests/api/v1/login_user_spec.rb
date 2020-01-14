require 'rails_helper'

describe 'Login User API', type: :request do
  it 'logs in a user and returns the users api_key' do
    User.destroy_all
    user = User.create!( email: "whatever@example.com", password: "password", password_confirmation: "password")
    user_api_key = user.api_key
    req_body = {
              "email": "whatever@example.com",
              "password": "password"
            }
    post '/api/v1/sessions', params: {user: req_body}


    api_key_response = JSON.parse(response.body)

    expect(api_key_response).to be_a Hash
    expect(api_key_response).to have_key 'api_key'
    expect(api_key_response['api_key']).to eq user_api_key
    expect(response.status).to eq 200
  end

  it 'does not log in a user with incomplete info' do
    User.destroy_all
    user = User.create!( email: "whatever@example.com", password: "password", password_confirmation: "password")
    user_api_key = user.api_key
    req_body = {
              "email": "whatever@example.com",
            }
    post '/api/v1/sessions', params: {user: req_body}

    error_response = JSON.parse(response.body)
    expected_error = {"error"=>"credentials are bad"}
    expect(error_response).to eq expected_error
    expect(response.status).to eq 400
  end
end
