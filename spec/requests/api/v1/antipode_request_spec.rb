require 'rails_helper'

describe 'Antipode weather lookup api' do
  it 'returns the city name and current weather of that city', :vcr do
    city = 'Hong Kong'
    get "/api/v1/antipode?location=#{city}"

    expect(response).to be_successful

    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_response[:attributes]).to have_key :location_name
    expect(parsed_response[:attributes]).to have_key :forecast
    expect(parsed_response[:attributes][:forecast]).to have_key :summary
    expect(parsed_response[:attributes][:forecast]).to have_key :current_temperature
    expect(parsed_response[:attributes]).to have_key :search_location
  end

  it 'returns the city name and current weather of a different city', :vcr do
    city = 'Bogota, Colombia'
    get "/api/v1/antipode?location=#{city}"

    expect(response).to be_successful

    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_response[:attributes]).to have_key :location_name
    expect(parsed_response[:attributes]).to have_key :forecast
    expect(parsed_response[:attributes][:forecast]).to have_key :summary
    expect(parsed_response[:attributes][:forecast]).to have_key :current_temperature
    expect(parsed_response[:attributes]).to have_key :search_location
  end

  it 'if no antipode city is found', :vcr do
    city = 'Denver, CO'
    get "/api/v1/antipode?location=#{city}"

    expect(response).to be_successful

    parsed_response = JSON.parse(response.body, symbolize_names: true)
    expect(parsed_response[:attributes]).to have_key :location_name
    expect(parsed_response[:attributes]).to have_key :forecast
    expect(parsed_response[:attributes][:forecast]).to have_key :summary
    expect(parsed_response[:attributes][:forecast]).to have_key :current_temperature
    expect(parsed_response[:attributes]).to have_key :search_location
  end

  it 'returns error data if no place is found from google', :vcr do
    city = 'Montevideo, Uruguay'
    get "/api/v1/antipode?location=#{city}"

    expect(response).to be_successful
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    expect(parsed_response[:attributes][:location_name]).to eq "Sorry, no places found for coordinates 34.9011127,123.83546860000001"
    expect(parsed_response[:attributes][:forecast]).to have_key :summary
    expect(parsed_response[:attributes][:forecast]).to have_key :current_temperature
    expect(parsed_response[:attributes]).to have_key :search_location
  end
end
