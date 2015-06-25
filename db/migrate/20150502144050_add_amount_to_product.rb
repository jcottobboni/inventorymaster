class AddAmountToProduct < ActiveRecord::Migration
  def change
  	add_column :inventorymaster_products, :ammount, :integer
  end
end
