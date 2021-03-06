require 'rails_helper'

describe DarkskyService do
  it 'returns forecast information', :vcr do
    service = DarkskyService.new('39.7392358,-104.990251')
    forecast = service.forecast

    expect(forecast).to be_a Hash
    expect(forecast).to have_key :currently
    expect(forecast[:currently]).to have_key :time
    expect(forecast[:currently]).to have_key :summary
    expect(forecast[:currently]).to have_key :icon
    expect(forecast[:currently]).to have_key :temperature
    expect(forecast[:daily][:data][0]).to have_key :temperatureHigh
    expect(forecast[:daily][:data][0]).to have_key :temperatureLow

    expect(forecast).to have_key :hourly
    expect(forecast[:hourly]).to have_key :data
    expect(forecast[:hourly][:data][0]).to have_key :time
    expect(forecast[:hourly][:data][0]).to have_key :temperature

    expect(forecast).to have_key :daily
  end

  it 'returns forecast information for night', :vcr do
    service = DarkskyService.new('39.7392358,-104.990251')
    time = Time.at(1579150800).utc
    specific_forecast = service.specific_forecast('39.7392358,-104.990251', time)
    expect(specific_forecast).to have_key :currently
    expect(specific_forecast[:currently]).to have_key :summary
  end

end
