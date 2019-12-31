# frozen_string_literal: true

class Listing < ApplicationRecord
  validates :property_type, presence: true, inclusion: { in: %w[Apartment House Warehouse],
                                                         message: '%{value} is not a valid property type' }
  validates :bedrooms, presence: true, numericality: { only_integer: true }
end
