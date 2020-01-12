require 'rails_helper'

describe GoogleGeoService do
  it 'returns the latitude and longitude of a location', :vcr do
    service = GoogleGeoService.new('Denver, CO')
    found_coordinates = service.coordnates

    expect(found_coordinates).to eq('39.7392358,-104.990251')
  end

  it 'returns the location info with country name', :vcr do
    service = GoogleGeoService.new('Denver, CO')
    location_info = service.city_state_country

    expect(location_info).to eq({location: 'Denver, CO', country: 'United States'})
  end
end
