class CreateInventories < ActiveRecord::Migration[5.1]
  def change
    create_table :inventories do |t|
      t.boolean :open, default: true
      t.datetime :closed_at

      t.timestamps
    end
  end
end
