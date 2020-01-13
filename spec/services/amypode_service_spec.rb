require 'rails_helper'

describe AmypodeService do
  it 'returns the antipode city lat and long', :vcr do
    hong_kong_lat_long = "22.3193039,114.1693611"
    antipode_lat_long = AmypodeService.antipode(hong_kong_lat_long)

    expect(antipode_lat_long).to be_a String
    expect(antipode_lat_long).to eq "-22.3193039,-65.8306389"
  end
end
