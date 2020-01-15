require 'rails_helper'
require_relative 'current_full_forecast_mock'

describe Forecast do
  it 'makes a forecast for a location with current time' do
    lat_long = '39.7392358,-104.990251'
    current_full_forecast = CurrentFullForecastMock.forecast

    forecast = Forecast.new(lat_long, current_full_forecast)

    expect(forecast).to be_a Forecast

    expected_hourly = [{:time=>"11 AM", :temperature=>40.76},
                       {:time=>"12 PM", :temperature=>45.8},
                       {:time=>" 1 PM", :temperature=>48.81},
                       {:time=>" 2 PM", :temperature=>50.5},
                       {:time=>" 3 PM", :temperature=>49.41},
                       {:time=>" 4 PM", :temperature=>46.91},
                       {:time=>" 5 PM", :temperature=>42.57},
                       {:time=>" 6 PM", :temperature=>39.08}]

    expected_five_days =   [{:day=>"Thursday",
                              :icon=>"cloudy",
                              :precip_probability=>0.06,
                              :precip_type=>"snow",
                              :temp_high=>44.5,
                              :temp_low=>22.14},
                             {:day=>"Friday",
                              :icon=>"wind",
                              :precip_probability=>0.07,
                              :precip_type=>"rain",
                              :temp_high=>49.86,
                              :temp_low=>27.28},
                             {:day=>"Saturday",
                              :icon=>"partly-cloudy-day",
                              :precip_probability=>0.02,
                              :precip_type=>"snow",
                              :temp_high=>43.67,
                              :temp_low=>21.67},
                             {:day=>"Sunday",
                              :icon=>"clear-day",
                              :precip_probability=>0.01,
                              :precip_type=>"snow",
                              :temp_high=>50.89,
                              :temp_low=>25.33},
                             {:day=>"Monday",
                              :icon=>"partly-cloudy-day",
                              :precip_probability=>0.04,
                              :precip_type=>"snow",
                              :temp_high=>54.99,
                              :temp_low=>24.56}]

    expect(forecast.hourly).to be_a HourlyForecast
    expect(forecast.hourly.hourly_data).to eq expected_hourly

    expect(forecast.daily).to be_a DailyForecast
    expect(forecast.daily.daily_data).to eq expected_five_days
  end
end
