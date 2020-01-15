require 'rails_helper'

describe Weather do
  xit 'makes a weather summary', :vcr do
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

  xit 'makes weather details hash', :vcr do
    weather = Weather.new('San Jose,CA')
    result_details = { :icon=>"rain",
                       :today_details=>"Possible drizzle overnight.",
                       :tonight_details=>"Clear",
                       :feels_like=>47.48,
                       :humidity=>0.82,
                       :visibility_miles=>10,
                       :uv_index=>0,
                       :uv_index_relative=>"low"}

    expect(weather.details).to eq result_details
  end
end
