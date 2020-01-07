# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AccessToken, type: :model do
  describe '#validations' do
    it 'should generate a valid factory' do
      user = build :user
      token = build :access_token, user: user
      expect(token).to be_valid
    end

    it 'should validate the presence of token' do
      token = build :access_token, token: nil
      expect(token).not_to be_valid
      expect(token.errors.messages[:token]).to include("can't be blank")
    end

    it 'should validate the uniqueness of token' do
      user = create :user
      user1 = create :user
      token = create :access_token, user: user
      other_token = build :access_token, token: token.token, user: user1
      expect(other_token).not_to be_valid
      other_token.token = 'valid token'
      expect(other_token).to be_valid
    end
  end
  describe '#new' do
    it 'should have a token present after initialization' do
      expect(AccessToken.new.token).to be_present
    end

    it 'should generate an unique token' do
      user = create :user
      expect { user.create_access_token }.to change { AccessToken.count }.by(1)
    end
  end
end
