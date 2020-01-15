class UnsplashService

  def initialize(search_term)
    @search_term = search_term
  end

  def fetch_image_info
    response = Faraday.get('https://api.unsplash.com/search/photos') do |req|
      req.params['query'] = search_term
      req.params['per_page'] = 1
      req.params['client_id'] = ENV['UNSPLASH_API_KEY']
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  attr_reader :search_term
end
