class CreateInventorymasterManufacturers < ActiveRecord::Migration
  def change
    create_table :inventorymaster_manufacturers do |t|
      t.string :name
      t.string :cnpj

      t.timestamps null: false
    end
  end
end
