class User < ApplicationRecord
  has_secure_password
  has_secure_token :api_key
  validates_presence_of :email, :password_confirmation
  validates_uniqueness_of :email

  # before_create do |user|
  #   user.api_key = user.generate_api_key
  # end
  #
  # def generate_api_key
  #   loop do
  #     token = SecureRandom.base64.tr('+/=', 'Qrt')
  #     break token unless User.exists?(api_key: token)
  #   end
  # end
end
