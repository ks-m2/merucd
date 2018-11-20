class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :user_id
      t.integer :genre,default: 0,nill: false
      t.integer :status,default: 0,nill: false
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
