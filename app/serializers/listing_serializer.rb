# frozen_string_literal: true

class ListingSerializer < ActiveModel::Serializer
  attributes :id, :property_type, :bedrooms, :bathrooms, :floor, :meters, :description, :price, :slug
end
