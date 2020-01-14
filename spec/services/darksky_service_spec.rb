require 'rails_helper'

describe DarkskyService do
  it 'returns forecast information', :vcr do
    VCR.use_cassette('returns_forecast_information.yml', :match_requests_on => [:method, :path]) do
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
  end

  it 'returns forecast information for night', :vcr do
    VCR.use_cassette('returns_forecast_information_for_night.yml', :match_requests_on => [:method, :host]) do
      service = DarkskyService.new('39.7392358,-104.990251')
      evening_forecast = service.evening_forecast
      expect(evening_forecast).to have_key :currently
      expect(evening_forecast[:currently]).to have_key :summary
    end
  end

end
