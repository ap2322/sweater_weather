require 'rails_helper'

describe UnsplashService do
  it 'fetches images with a search term', :vcr do
    search_term = 'denver,co'

    service = UnsplashService.new(search_term)
    unsplash_response = service.fetch_image_info

    expect(unsplash_response).to have_key :results
    expect(unsplash_response[:results][0]).to have_key :links
    expect(unsplash_response[:results][0][:links]).to have_key :html
  end
end
