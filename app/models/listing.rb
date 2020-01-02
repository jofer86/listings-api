# frozen_string_literal: true

class Listing < ApplicationRecord
  validates :property_type, presence: true, inclusion: { in: %w[Apartment House Warehouse],
                                                         message: '%{value} is not a valid property type' }
  validates :bedrooms, presence: true, numericality: { only_integer: true }
  validates :bathrooms, presence: true, numericality: { only_integer: true }
  validates :floor, presence: true, numericality: { only_integer: true }
  validates :meters, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :description, presence: true,
                          length: { minimum: 50, message: 'Description is too short' }

  scope :latest, -> { order(created_at: :desc) }
end
