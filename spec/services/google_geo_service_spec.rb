require 'rails_helper'

describe GoogleGeoService do
  it 'returns the latitude and longitude of a location', :vcr do
    service = GoogleGeoService.new('Denver, CO')
    found_info = service.get_geographic_info

    expect(found_info).to be_a Hash
    expect(found_info[:results]).to be_a Array
    expect(found_info[:results][0][:address_components]).to be_a Array
    expect(found_info[:results][0][:address_components][0]).to have_key :long_name
    expect(found_info[:results][0][:address_components][0]).to have_key :short_name
    expect(found_info[:results][0][:geometry]).to have_key :location
  end
end
