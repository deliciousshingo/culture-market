class CreateDances < ActiveRecord::Migration[6.0]
  def change
    create_table :dances do |t|
      t.string :title, null: false
      t.integer :genre_id, null: false
      t.integer :price, null: false
      t.text :introduce, null: false
      t.time :reservation_time, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
