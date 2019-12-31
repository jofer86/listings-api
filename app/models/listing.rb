class Listing < ApplicationRecord
  validates :property_type, presence: true, inclusion: { in: %w(Apartment House Warehouse),
                                                          :message => "%{value} is not a valid property type" }
  
end 
