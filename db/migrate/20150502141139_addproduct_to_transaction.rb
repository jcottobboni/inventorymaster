class AddproductToTransaction < ActiveRecord::Migration
  def change
  	add_column :inventorymaster_transactions, :product_id, :integer
  end
end
