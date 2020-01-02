# frozen_string_literal: true

FactoryBot.define do
  factory :listing do
    property_type { 'Apartment' }
    bedrooms { 1 }
    bathrooms { 1 }
    floor { 1 }
    meters { 1 }
    sequence(:description) { |n| "This is a short and valid description of the listing #{n}" }
    price { 1 }
    sequence(:slug) { |n| "this-slug-is-gonna-be-a-link-to-an-image-#{n}" }
  end
end
