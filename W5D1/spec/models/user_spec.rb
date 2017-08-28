require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    FactoryGirl.build(:user,
      email: "random@fake.com",
      password: "password")
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe '#is_password?' do
    it 'verifies correct password' do
      expect(user.is_password?("password")).to be true
    end

    it 'rejects bad password' do
      expect(user.is_password?("badpass")).to be false
    end
  end

  describe '#reset_session_token' do
    it 'resets session token' do
      old_token = user.session_token
      user.reset_session_token!

      expect(user.session_token).to_not eq(old_token)
    end
  end

  describe '::find_by_credentials' do
    before { user.save! }

    it 'returns user from good credentials' do
      expect(User.find_by_credentials("random@fake.com", "password")).to eq(user)
    end

    it 'returns nil from bad credentials' do
      expect(User.find_by_credentials("random@fake.com", "badpass")).to eq(nil)
    end
  end


end
