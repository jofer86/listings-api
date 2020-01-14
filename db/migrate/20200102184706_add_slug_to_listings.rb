class AddSlugToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :slug, :string
  end
end
