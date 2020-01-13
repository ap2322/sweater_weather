require 'rails_helper'

describe User, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :email}
    it {should validate_presence_of :email}
    it {should validate_uniqueness_of :email}
  end

  describe 'methods' do
    it 'adds an api key for a user before create' do
      user_count = User.all.count
      user = User.create(email: 'example@email.com', password: 'password', password_confirmation: 'password')

      new_user_count = User.all.count
      expect(user.api_key).to_not be_nil
      expect(user_count + 1 ).to eq(new_user_count)
    end
  end
end
