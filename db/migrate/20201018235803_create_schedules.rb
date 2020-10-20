class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.boolean :active
      t.string :name
      t.string :program
      t.string :start_date
      t.string :form
      t.integer :start_day_int
      t.integer :weekly_count
      t.integer :hour
      t.string :category
      t.string :type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
