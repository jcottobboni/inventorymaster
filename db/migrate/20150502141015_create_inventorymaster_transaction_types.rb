class CreateInventorymasterTransactionTypes < ActiveRecord::Migration
  def change
    create_table :inventorymaster_transaction_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
