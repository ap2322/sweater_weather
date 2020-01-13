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
end


# { data: {
#   {
#     id: 1,
#     type: 'antipode',
#     attributes: {
#       location_name: 'Antipode City Name',
#       forecast: {
#         summmary: 'mostly cloudy',
#         current_temperature: 72,
#       },
#       search_location: 'Hong Kong',
#     }
