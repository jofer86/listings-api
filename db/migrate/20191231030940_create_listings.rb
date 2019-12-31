class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :property_type
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :floor
      t.integer :meters
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
