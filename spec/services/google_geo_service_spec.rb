require 'rails_helper'

describe GoogleGeoService do
  it 'returns the latitude and longitude of a location', :vcr do
    service = GoogleGeoService.new('Denver, CO')
    found_coordinates = service.coordinates

    expect(found_coordinates).to eq('39.7392358,-104.990251')
  end

  it 'returns the location info with country name', :vcr do
    service = GoogleGeoService.new('Denver, CO')
    location_info = service.city_state_country

    expect(location_info).to eq({location: 'Denver, CO', country: 'United States'})
  end

  it 'returns the location name of searched lat_long', :vcr do
    service = GoogleGeoService.new('Hong Kong')
    antipode_lat_long = "-22.3193039,-65.8306389"

    antipode_location = service.find_place(antipode_lat_long)

    expect(antipode_location).to eq("Yavi Department, Jujuy, Argentina")

  end
end
