class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :user_id
      t.integer :genre
      t.integer :status
      t.text :image_id
      t.string :label
      t.string :artist
      t.string :album
      t.integer :count
      t.text :introduction

      t.timestamps
    end
  end
end
