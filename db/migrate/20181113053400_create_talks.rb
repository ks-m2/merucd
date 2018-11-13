class CreateTalks < ActiveRecord::Migration[5.2]
  def change
    create_table :talks do |t|
      t.integer :user_id
      t.integer :room_id
      t.string :content

      t.timestamps
    end
  end
end
