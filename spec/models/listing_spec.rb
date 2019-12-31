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
    invalid_listing = build :listing, property_type: 'bunker'
    valid_listing = build :listing, property_type: 'Warehouse'
    expect(invalid_listing).not_to be_valid
    expect(invalid_listing.errors.messages[:property_type]).to include("#{invalid_listing[:property_type]} is not a valid property type")
    expect(valid_listing).to be_valid
  end

  it 'should validate the presence of the bedrooms property' do
    listing = build :listing, bedrooms: ''
    expect(listing).not_to be_valid
    expect(listing.errors.messages[:bedrooms]).to include("can't be blank")
  end

  it 'should validate the bedrooms property to be an integer' do
    invalid_listing = build :listing, bedrooms: "string"
    valid_listing = build :listing, bedrooms: 2
    expect(invalid_listing).not_to be_valid
    expect(invalid_listing.errors.messages[:bedrooms]).to include("is not a number")
    expect(valid_listing).to be_valid
  end

end
