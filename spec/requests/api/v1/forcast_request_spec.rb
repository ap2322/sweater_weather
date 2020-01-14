require 'rails_helper'

describe "Forecast API" do
  it "sends a json string of forecast information", :vcr do
      get '/api/v1/forecast?location=denver,co'
      expect(response).to be_successful

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to have_key :summary
      expect(parsed_response).to have_key :details
      expect(parsed_response).to have_key :five_day_forecast

  end
end
