class Background
  attr_reader :search_term, :image_url, :id

  def initialize(search_term)
    @search_term = search_term
    @image_url = get_image
    @id = 1
  end

  def get_image
    @_image_info ||= fetch_background_url
    @_image_info[:results][0][:links][:html]
  end

  private

  def fetch_background_url
    service = UnsplashService.new(search_term)
    service.fetch_image_info
  end
end
