class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :title,             null: false
      t.integer :evaluation_id,    null: false
      t.text :review,              null: false
      t.references :user,          foreign_key: true
      t.references :spot,          foreign_key: true
      t.timestamps
    end
  end
end
