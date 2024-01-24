class CreateInfectionNotification < ActiveRecord::Migration[7.1]
  def change
    create_table :infection_notifications do |t|
      t.integer :user_id, null: false
      t.integer :notifier_id, null: false

      t.timestamps
    end

    add_foreign_key :infection_notifications, :users, column: :user_id
    add_foreign_key :infection_notifications, :users, column: :notifier_id
  end
end
