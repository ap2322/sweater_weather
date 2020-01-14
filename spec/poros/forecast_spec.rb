require 'rails_helper'

describe Forecast do
  it 'makes a forecast for a location with current time', :vcr do
    lat_long = '39.7392358,-104.990251'
    forecast = Forecast.new(lat_long)

    expect(forecast).to be_a Forecast

    expected_hourly = [{:time=>"11", :temperature=>51.82},
                       {:time=>"12", :temperature=>55.89},
                       {:time=>" 1", :temperature=>57.06},
                       {:time=>" 2", :temperature=>56.63},
                       {:time=>" 3", :temperature=>55.08},
                       {:time=>" 4", :temperature=>51.82}]

    expected_five_days = [ {:day=>"Wednesday", :icon=>"clear-day", :precip_probability=>0.03, :precip_type=>"snow", :temp_high=>49.67, :temp_low=>21.83},
                           {:day=>"Thursday", :icon=>"cloudy", :precip_probability=>0.06, :precip_type=>"snow", :temp_high=>47.09, :temp_low=>22.76},
                           {:day=>"Friday", :icon=>"wind", :precip_probability=>0.07, :precip_type=>"rain", :temp_high=>49.32, :temp_low=>28.83},
                           {:day=>"Saturday", :icon=>"cloudy", :precip_probability=>0.04, :precip_type=>"snow", :temp_high=>39.66, :temp_low=>22.04},
                           {:day=>"Sunday", :icon=>"clear-day", :precip_probability=>0.05, :precip_type=>"snow", :temp_high=>48.8, :temp_low=>27.19}]
    expected_five_day_and_hourly = {:hourly_data=>
                                    [{:time=>"11", :temperature=>51.82},
                                     {:time=>"12", :temperature=>55.89},
                                     {:time=>" 1", :temperature=>57.06},
                                     {:time=>" 2", :temperature=>56.63},
                                     {:time=>" 3", :temperature=>55.08},
                                     {:time=>" 4", :temperature=>51.82}],
                                   :daily_data=>
                                    [{:day=>"Wednesday", :icon=>"clear-day", :precip_probability=>0.03, :precip_type=>"snow", :temp_high=>49.67, :temp_low=>21.83},
                                     {:day=>"Thursday", :icon=>"cloudy", :precip_probability=>0.06, :precip_type=>"snow", :temp_high=>47.09, :temp_low=>22.76},
                                     {:day=>"Friday", :icon=>"wind", :precip_probability=>0.07, :precip_type=>"rain", :temp_high=>49.32, :temp_low=>28.83},
                                     {:day=>"Saturday", :icon=>"cloudy", :precip_probability=>0.04, :precip_type=>"snow", :temp_high=>39.66, :temp_low=>22.04},
                                     {:day=>"Sunday", :icon=>"clear-day", :precip_probability=>0.05, :precip_type=>"snow", :temp_high=>48.8, :temp_low=>27.19}]}
    expect(forecast.hourly).to eq expected_hourly
    expect(forecast.five_days).to eq expected_five_days
    expect(forecast.five_day_and_hourly).to eq expected_five_day_and_hourly
  end
end
