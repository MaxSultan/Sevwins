class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :Organization
      t.string :timezone

      t.timestamps
    end
  end
end
