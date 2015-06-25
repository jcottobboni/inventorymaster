class CreateInventorymasterTransactions < ActiveRecord::Migration
  def change
    create_table :inventorymaster_transactions do |t|
      t.string :kind
      t.date :date
      t.integer :location_id
      t.integer :user_id
      t.string :upc
      t.float :unit_cost
      t.float :unit_sale
      t.integer :ammount
      t.float :average_cost
      t.string :reason
      t.string :comment
      t.string :serial_number
      t.integer :transaction_type_id

      t.timestamps null: false
    end
  end
end
