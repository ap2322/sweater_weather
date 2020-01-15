require 'rails_helper'

describe Background do
  it 'has an image', :vcr do
    background = Background.new('nowheresville,or')

    expect(background).to be_a Background
    expect(background.search_term).to eq 'nowheresville,or'
    expect(background.image_url).to eq 'https://unsplash.com/photos/6BVinN0Y7Xk'
  end

  it 'has a default image if no results are returned', :vcr do
    background = Background.new('ldkfeiffeee')

    expect(background.image_url).to eq 'https://unsplash.com/photos/yQorCngxzwI'
  end
end
