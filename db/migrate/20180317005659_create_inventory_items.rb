class CreateInventoryItems < ActiveRecord::Migration[5.1]
  def change
    create_table :inventory_items do |t|
      t.references :inventory, foreign_key: true
      t.references :product_unit, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
