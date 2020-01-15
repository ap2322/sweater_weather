class Background
  attr_reader :search_term, :image_url, :id

  def initialize(search_term)
    @default_image = 'https://unsplash.com/photos/yQorCngxzwI'
    @search_term = search_term
    @image_url = get_image
    @id = 1
  end

  def get_image
    @_image_info ||= fetch_background_url
    return default_image if @_image_info[:results].empty?
    @_image_info[:results][0][:links][:html]
  end

  private
  attr_reader :default_image

  def fetch_background_url
    service = UnsplashService.new(search_term)
    service.fetch_image_info
  end
end
