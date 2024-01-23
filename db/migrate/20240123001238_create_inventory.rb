class CreateInventory < ActiveRecord::Migration[7.1]
  def change
    create_table :inventories do |t|
      t.integer :user_id, null: false
      t.integer :item_id, null: false 

      t.timestamps
    end

    add_foreign_key :inventories, :users, column: :user_id
    add_foreign_key :inventories, :items, column: :item_id
  end
end
