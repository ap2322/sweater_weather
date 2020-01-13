require 'rails_helper'

describe 'Antipode weather lookup api' do
  it 'returns the city name and current weather of that city', :vcr do
    WebMock.enable_net_connect!
    VCR.eject_cassette
    VCR.turn_off!(ignore_cassettes: true)
    city = 'Hong Kong'
    get "/api/v1/antipode?location=#{city}"

    expect(response).to be_successful

    parsed_response = JSON.parse(response.body, symbolize_names: true)
    expect(parsed_response).to have_key :location_name
    expect(parsed_response).to have_key :forecast
    expect(parsed_response[:forecast]).to have_key :summary
    expect(parsed_response[:forecast]).to have_key :current_temperature
    expect(parsed_response).to have_key :search_location

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
