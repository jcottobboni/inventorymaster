class AddlocationToProduct < ActiveRecord::Migration
  def change
  	add_column :inventorymaster_products, :location_id, :integer
  end
end
