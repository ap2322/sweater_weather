require 'rails_helper'

describe "Forecast API" do
  it "sends a list of items" do

    get '/api/v1/forecast?location=denver,co'
    # Needs to pull out the city and state from the GET request
    # and send it to Google’s Geocoding API to retrieve the lat and long for the city (this can be its own story).
    # Use of the Google Geocoding API is a hard requirement.


    # Retrieve forecast data from the Darksky API using the lat and long

    # response is based on wireframe
    expect(response).to be_successful
  end
end
