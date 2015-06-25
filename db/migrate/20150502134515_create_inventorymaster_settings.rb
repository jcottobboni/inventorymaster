class CreateInventorymasterSettings < ActiveRecord::Migration
  def change
    create_table :inventorymaster_settings do |t|
      t.boolean :stok_alerts
      t.integer :minimum_stock_count
      t.string :currency

      t.timestamps null: false
    end
  end
end
