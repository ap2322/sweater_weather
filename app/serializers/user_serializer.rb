class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :api_key

  def serializable_hash
    data = super
    if data[:data].is_a? Hash
      data[:data][:attributes]
    else
      data
    end
  end
end
