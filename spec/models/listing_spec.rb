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
    expect(invalid_listing.errors.messages[:property_type])
      .to include("#{invalid_listing[:property_type]} is not a valid property type")
    expect(valid_listing).to be_valid
  end

  it 'should validate the presence of the bedrooms property' do
    listing = build :listing, bedrooms: ''
    expect(listing).not_to be_valid
    expect(listing.errors.messages[:bedrooms]).to include("can't be blank")
  end

  it 'should validate the bedrooms property to be an integer' do
    invalid_listing = build :listing, bedrooms: 'string'
    valid_listing = build :listing, bedrooms: 2
    expect(invalid_listing).not_to be_valid
    expect(invalid_listing.errors.messages[:bedrooms]).to include('is not a number')
    expect(valid_listing).to be_valid
  end

  it 'should validate the presence of the bathrooms property' do
    listing = build :listing, bathrooms: ''
    expect(listing).not_to be_valid
    expect(listing.errors.messages[:bathrooms]).to include("can't be blank")
  end

  it 'should validate the bathrooms property to be an integer' do
    invalid_listing = build :listing, bathrooms: 'string'
    valid_listing = build :listing, bathrooms: 2
    expect(invalid_listing).not_to be_valid
    expect(invalid_listing.errors.messages[:bathrooms]).to include('is not a number')
    expect(valid_listing).to be_valid
  end

  it 'should validate the presence of the floor property' do
    listing = build :listing, floor: ''
    expect(listing).not_to be_valid
    expect(listing.errors.messages[:floor]).to include("can't be blank")
  end

  it 'should validate the floor property to be an integer' do
    invalid_listing = build :listing, floor: 'string'
    valid_listing = build :listing, floor: 2
    expect(invalid_listing).not_to be_valid
    expect(invalid_listing.errors.messages[:floor]).to include('is not a number')
    expect(valid_listing).to be_valid
  end

  it 'should validate the presence of the meters property' do
    listing = build :listing, meters: ''
    expect(listing).not_to be_valid
    expect(listing.errors.messages[:meters]).to include("can't be blank")
  end

  it 'should validate the meters property to be an integer' do
    invalid_listing = build :listing, meters: 'string'
    valid_listing = build :listing, meters: 2
    expect(invalid_listing).not_to be_valid
    expect(invalid_listing.errors.messages[:meters]).to include('is not a number')
    expect(valid_listing).to be_valid
  end

  it 'should validate the presence of the price property' do
    listing = build :listing, price: ''
    expect(listing).not_to be_valid
    expect(listing.errors.messages[:price]).to include("can't be blank")
  end

  it 'should validate the price property to be an integer' do
    invalid_listing = build :listing, price: 'string'
    valid_listing = build :listing, price: 2
    expect(invalid_listing).not_to be_valid
    expect(invalid_listing.errors.messages[:price]).to include('is not a number')
    expect(valid_listing).to be_valid
  end

  it 'should validate the presence of the description property' do
    listing = build :listing, description: ''
    expect(listing).not_to be_valid
    expect(listing.errors.messages[:description]).to include("can't be blank")
  end

  it 'should validate the minimun length of the description property to 50 characters' do
    invalid_listing = build :listing, description: 'This is not a valid one'
    expect(invalid_listing).not_to be_valid
    expect(invalid_listing.errors.messages[:description])
      .to include('Description is too short')
  end

  describe '.latest' do
    it 'should list the lastest listing first' do
      old_listing = create :listing
      newer_listing = create :listing
      expect(Listing.latest).to eq(
        [newer_listing, old_listing]
      )
      old_listing.update_column :created_at, Time.now
      expect(Listing.latest).to eq(
        [old_listing, newer_listing]
      )
    end
  end

end
