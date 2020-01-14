require 'rails_helper'

describe Weather do
  it 'makes a weather summary', :vcr do
    VCR.use_cassette('makes_a_weather_summary.yml', :match_requests_on => [:method, :path]) do
      @weather = Weather.new('Denver,CO')
    end

    expect(@weather).to be_a Weather
    result_summary = { :location=>"Denver, CO",
                       :country=>"United States",
                       :time=>"10:07PM",
                       :date=>"13/1",
                       :temperature=>30.86,
                       :temperature_high=>45.77,
                       :temperature_low=>21.66,
                       :summary=>"Clear",
                       :icon=>"clear-night"}
    expect(@weather.summary).to eq result_summary
  end

  it 'makes weather details hash', :vcr do
    VCR.use_cassette('makes_a_weather_details_hash.yml', :match_requests_on => [:method, :path]) do
      @weather = Weather.new('San Jose,CA')
    end
    result_details = { :icon=>"rain",
                       :today_details=>"Possible drizzle overnight.",
                       :tonight_details=>"Clear",
                       :feels_like=>47.48,
                       :humidity=>0.82,
                       :visibility_miles=>10,
                       :uv_index=>0,
                       :uv_index_relative=>"low"}

    expect(@weather.details).to eq result_details
  end
end
