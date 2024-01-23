class CreateItem < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.integer :points, default: 1, null: false

      t.timestamps
    end
  end
end
