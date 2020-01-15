require 'rails_helper'

describe 'Background Image Endpoint', type: :request do
  it 'returns the url to an appropriate background image for a location', :vcr do
    location = 'denver,co'
    get "/api/v1/backgrounds?location=#{location}"

    image_response = JSON.parse(response.body, symbolize_names: true)
    expect(image_response).to be_a Hash
    expect(image_response[:data][:attributes]).to have_key :image_url
  end
end
