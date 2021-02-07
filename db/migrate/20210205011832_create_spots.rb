class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.string :name,            null: false
      t.integer :genre_id,       null: false
      t.integer :place_id,      null: false
      t.text :explanation,       null: false
      t.text :plan,              null: false
      t.integer :wifi_id,        null: false
      t.string :budget,          null: false
      t.references :user,  foreign_key: true
      t.timestamps
    end
  end
end
