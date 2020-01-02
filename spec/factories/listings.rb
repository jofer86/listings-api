# frozen_string_literal: true

FactoryBot.define do
  factory :listing do
    property_type { 'Apartment' }
    bedrooms { 1 }
    bathrooms { 1 }
    floor { 1 }
    meters { 1 }
    description { 'This is a short and valid description of the listing' }
    price { 1 }
  end
end
