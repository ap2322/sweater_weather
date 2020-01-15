require 'rails_helper'

describe "Forecast API" do
  it "sends a json string of forecast information", :vcr do
    get '/api/v1/forecast?location=denver,co'
    expect(response).to be_successful

    parsed_response = JSON.parse(response.body, symbolize_names: true)
    attributes = parsed_response[:data][:attributes]

    expect(attributes).to have_key :summary
    expect(attributes[:summary]).to have_key :location
    expect(attributes[:summary]).to have_key :country
    expect(attributes[:summary]).to have_key :time
    expect(attributes[:summary]).to have_key :date
    expect(attributes[:summary]).to have_key :temperature
    expect(attributes[:summary]).to have_key :temperature_high
    expect(attributes[:summary]).to have_key :temperature_low
    expect(attributes[:summary]).to have_key :summary
    expect(attributes[:summary]).to have_key :icon

    expect(attributes).to have_key :details
    expect(attributes[:details]).to have_key :icon
    expect(attributes[:details]).to have_key :summary
    expect(attributes[:details]).to have_key :today_details
    expect(attributes[:details]).to have_key :tonight_details
    expect(attributes[:details]).to have_key :feels_like
    expect(attributes[:details]).to have_key :humidity
    expect(attributes[:details]).to have_key :visibility_miles
    expect(attributes[:details]).to have_key :uv_index
    expect(attributes[:details]).to have_key :uv_index_relative

    expect(attributes).to have_key :forecast
    expect(attributes[:forecast]).to have_key :hourly
    expect(attributes[:forecast][:hourly]).to have_key :hourly_data
    expect(attributes[:forecast][:hourly][:hourly_data][0]).to have_key :time
    expect(attributes[:forecast][:hourly][:hourly_data][0]).to have_key :temperature

    expect(attributes[:forecast]).to have_key :daily
    expect(attributes[:forecast][:daily]).to have_key :daily_data
    expect(attributes[:forecast][:daily][:daily_data][0]).to have_key :day
    expect(attributes[:forecast][:daily][:daily_data][0]).to have_key :icon
    expect(attributes[:forecast][:daily][:daily_data][0]).to have_key :precip_probability
    expect(attributes[:forecast][:daily][:daily_data][0]).to have_key :precip_type
    expect(attributes[:forecast][:daily][:daily_data][0]).to have_key :temp_high
    expect(attributes[:forecast][:daily][:daily_data][0]).to have_key :temp_low

  end

  it 'can search for a location in a different timezone', :vcr do
    get '/api/v1/forecast?location=san jose,ca'
    expect(response).to be_successful

    sj_parsed_response = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
    san_jose_time_string = sj_parsed_response[:summary][:time]
    expect(san_jose_time_string).to be_a String

    get '/api/v1/forecast?location=denver,co'
    expect(response).to be_successful
    denver_parsed_response = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
    denver_time_string = denver_parsed_response[:summary][:time]

    expect(san_jose_time_string).to_not eq denver_time_string
    # expect(sj_parsed_response[:forecast][:hourly][:hourly_data][0][:time]).to_not eq(
    #   denver_parsed_response[:forecast][:hourly][:hourly_data][0][:time]
    # )

  end
end
