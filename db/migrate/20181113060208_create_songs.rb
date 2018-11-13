class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.integer :title
      t.integer :user_id

      t.timestamps
    end
  end
end
