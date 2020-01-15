require 'rails_helper'

describe 'Road Trip API Endpoint', type: :request do
  it 'returns origin, destination, travel time, and arrival forecast with a successful request', :vcr do
    WebMock.enable_net_connect!
    VCR.eject_cassette
    VCR.turn_off!(ignore_cassettes: true)
    
    user = User.create(email: 'road@tripper.com', password: 'something', password_confirmation: 'something')
    body = {
              "origin": "Denver,CO",
              "destination": "Pueblo,CO",
              "api_key": "#{user.api_key}"
            }

    post '/api/v1/road_trip', params: body
    road_trip_info = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq 200
    expect(road_trip_info[:data][:attributes]).to have_key :origin
    expect(road_trip_info[:data][:attributes]).to have_key :destination
    expect(road_trip_info[:data][:attributes]).to have_key :travel_time
    expect(road_trip_info[:data][:attributes]).to have_key :arrival_forecast
    expect(road_trip_info[:data][:attributes][:arrival_forecast]).to have_key :temperature
    expect(road_trip_info[:data][:attributes][:arrival_forecast]).to have_key :summary
  end

  it 'prevents access with wrong or no token' do
    user = User.create(email: 'road@tripper.com', password: 'something', password_confirmation: 'something')
    body = {
              "origin": "Denver,CO",
              "destination": "Pueblo,CO",
              "api_key": "something_else_not_in_db"
            }

    post '/api/v1/road_trip', params: body

    error_info = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq 401
    expect(error_info).to eq({error:"Unauthorized request"})
  end
end
