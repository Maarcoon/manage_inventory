class CreateProductUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :product_units do |t|
      t.references :product, foreign_key: true
      t.string :rfid
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
