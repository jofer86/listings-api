FactoryBot.define do
  factory :listing do
    property_type { "MyString" }
    bedrooms { 1 }
    bathrooms { 1 }
    floor { 1 }
    bedrooms { 1 }
    meters { 1 }
    description { "MyText" }
    price { 1 }
  end
end
