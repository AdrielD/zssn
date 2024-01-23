class CreateUser < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string  :name, null: false
      t.integer :age, null: false
      t.string  :gender, default: 'other', null: false
      t.decimal :lat, precision: 7, scale: 5, default: 0.00000, null: false
      t.decimal :lng, precision: 8, scale: 5, default: 0.00000, null: false
      t.boolean :infected, default: false, null: false

      t.timestamps
    end
  end
end
