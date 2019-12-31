# frozen_string_literal: true

require 'rails_helper'

describe '#listings' do
  it 'should generate a valid factory' do
    listing = build :listing
    expect(listing).to be_valid
  end

  it 'should validate presence of property_type' do
    listing = build :listing, property_type: ''
    expect(listing).not_to be_valid
    expect(listing.errors.messages[:property_type]).to include("can't be blank")
  end

  it 'should validate if the real state type is valid' do
    listing = build :listing, property_type: 'bunker'
    expect(listing).not_to be_valid
    expect(listing.errors.messages[:property_type]).to include("#{listing[:property_type]} is not a valid property type")
  end
end
