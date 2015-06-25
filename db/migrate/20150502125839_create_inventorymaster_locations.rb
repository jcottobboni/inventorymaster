class CreateInventorymasterLocations < ActiveRecord::Migration
  def change
    create_table :inventorymaster_locations do |t|
      t.string :name
      t.string :street_adress
      t.string :city
      t.string :state
      t.string :zip_code

      t.timestamps null: false
    end
  end
end
