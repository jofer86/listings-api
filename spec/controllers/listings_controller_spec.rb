# frozen_string_literal: true

require 'rails_helper'

describe ListingsController do
  describe '#index' do
    subject { get :index }
    it 'Should return success response' do
      subject
      expect(response).to have_http_status(:ok)
    end

    it 'Should return proper json' do
      create_list :listing, 2
      subject
      Listing.latest.each_with_index do |listing, i|
        expect(json_data[i]['attributes']).to eq(
          'property-type' => listing.property_type,
          'bedrooms' => listing.bedrooms,
          'bathrooms' => listing.bathrooms,
          'floor' => listing.floor,
          'meters' => listing.meters,
          'description' => listing.description,
          'price' => listing.price,
          'slug' => listing.slug
        )
      end
    end

    it 'should return articles in the proper order' do
      old_listing = create :listing
      newer_listing = create :listing
      subject
      expect(json_data.first['id']).to eq(newer_listing.id.to_s)
      expect(json_data.last['id']).to eq(old_listing.id.to_s)
    end
  end
end
