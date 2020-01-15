require 'rails_helper'

describe GoogleDirectionsService do
  it 'finds information between two locations', :vcr do
    service = GoogleDirectionsService.new("Denver,CO","Pueblo,CO")
    directions = service.directions
    
    expect(directions[:routes][0][:legs][0]).to have_key :duration
    expect(directions[:routes][0][:legs][0][:duration]).to have_key :text
  end
end
