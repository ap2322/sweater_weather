require 'rails_helper'
require_relative 'current_full_forecast_mock'
require_relative 'evening_forecast_mock'

describe Weather do
  it 'makes a weather summary' do

    location = 'Denver,CO'
    current_forecast = CurrentFullForecastMock.forecast
    lat_long = '39.7392358,-104.990251'
    google_location_info = {:location=>"Denver, CO", :country=>"United States"}
    evening_forecast = EveningForecastMock.forecast

    weather = Weather.new(location, lat_long, google_location_info, current_forecast, evening_forecast)

    expect(weather).to be_a Weather

    expect(weather.summary).to be_a WeatherSummary
    json_summary = weather.summary.to_json
    summary_output = JSON.parse(json_summary, symbolize_names: true)
    expected_summary = {:location=>"Denver, CO",
                         :country=>"United States",
                         :time=>"11:50 AM",
                         :date=>"1/15",
                         :temperature=>45.1,
                         :temperature_high=>51.01,
                         :temperature_low=>22.14,
                         :summary=>"Clear",
                         :icon=>"clear-day"}

    expect(summary_output).to eq expected_summary

  end

  it 'makes weather details hash' do
    location = 'Denver,CO'
    current_forecast = CurrentFullForecastMock.forecast
    lat_long = '39.7392358,-104.990251'
    google_location_info = {:location=>"Denver, CO", :country=>"United States"}
    evening_forecast = EveningForecastMock.forecast

    weather = Weather.new(location, lat_long, google_location_info, current_forecast, evening_forecast)

    expect(weather.details).to be_a WeatherDetails

    json_summary = weather.details.to_json
    details_output = JSON.parse(json_summary, symbolize_names: true)

    expected_details = {:icon=>"clear-day",
                       :summary=>"Clear",
                       :today_details=>"Clear throughout the day.",
                       :tonight_details=>"Clear",
                       :feels_like=>41.48,
                       :humidity=>0.28,
                       :visibility_miles=>10,
                       :uv_index=>2,
                       :uv_index_relative=>"low"}

    expect(details_output).to eq expected_details

  end
end
