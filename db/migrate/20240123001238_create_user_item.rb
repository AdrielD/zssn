class CreateUserItem < ActiveRecord::Migration[7.1]
  def change
    create_table :user_items do |t|
      t.integer :user_id, null: false
      t.integer :item_id, null: false
      t.integer :amount, default: 0, null: false

      t.timestamps
    end

    add_foreign_key :user_items, :users, column: :user_id
    add_foreign_key :user_items, :items, column: :item_id
  end
end
