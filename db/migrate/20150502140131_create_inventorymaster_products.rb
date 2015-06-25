class CreateInventorymasterProducts < ActiveRecord::Migration
  def change
    create_table :inventorymaster_products do |t|
      t.string :name
      t.string :sku
      t.string :upc
      t.text :summary
      t.string :labels
      t.integer :area_id
      t.integer :manufacturer_id
      t.integer :minimum_stock_count

      t.timestamps null: false
    end
  end
end
