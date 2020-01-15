class BackgroundImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :search_term, :image_url
end
