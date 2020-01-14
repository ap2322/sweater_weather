require 'rails_helper'

describe Weather do
  it 'makes a weather summary', :vcr do
    weather = Weather.new('Denver,CO')

    expect(weather).to be_a Weather
    result_summary = { :location=>"Denver, CO",
                       :country=>"United States",
                       :time=>"10:07PM",
                       :date=>"13/1",
                       :temperature=>30.86,
                       :temperature_high=>45.77,
                       :temperature_low=>21.66,
                       :summary=>"Clear",
                       :icon=>"clear-night"}
    expect(weather.summary).to eq result_summary
  end

  it 'makes weather details hash', :vcr do
    weather = Weather.new('San Jose,CA')
    result_details = { :icon=>"rain",
                       :today_details=>"Possible drizzle overnight.",
                       :tonight_details=>"Partly Cloudy",
                       :feels_like=>47.48,
                       :humidity=>0.82,
                       :visibility_miles=>10,
                       :uv_index=>0,
                       :uv_index_relative=>"low"}

    expect(weather.details).to eq result_details
  end

  it 'makes an hourly and five day forecast hash', :vcr do
    weather = Weather.new('San Jose,CA')
    result_five_day = {:hourly_data=>
                        [{:time=>"10", :temperature=>48.4},
                         {:time=>"11", :temperature=>46.67},
                         {:time=>"12", :temperature=>47.3},
                         {:time=>" 1", :temperature=>50.85},
                         {:time=>" 2", :temperature=>51.26},
                         {:time=>" 3", :temperature=>51.39}],
                       :daily_data=>
                        [{:day=>"Tuesday", :icon=>"rain", :precip_probability=>0.49, :precip_type=>"rain", :temp_high=>54.81, :temp_low=>39.03},
                         {:day=>"Wednesday", :icon=>"cloudy", :precip_probability=>0.12, :precip_type=>"rain", :temp_high=>54.51, :temp_low=>38.2},
                         {:day=>"Thursday", :icon=>"rain", :precip_probability=>0.95, :precip_type=>"rain", :temp_high=>51.29, :temp_low=>40.99},
                         {:day=>"Friday", :icon=>"cloudy", :precip_probability=>0.16, :precip_type=>"rain", :temp_high=>51.96, :temp_low=>38.88},
                         {:day=>"Saturday", :icon=>"cloudy", :precip_probability=>0.31, :precip_type=>"rain", :temp_high=>53.98, :temp_low=>41.63}]}

    expect(weather.five_day_forecast).to eq result_five_day
  end
end
