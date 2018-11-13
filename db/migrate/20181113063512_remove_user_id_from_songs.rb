class RemoveUserIdFromSongs < ActiveRecord::Migration[5.2]
  def change
    remove_column :songs, :User_id, :integer
  end
end
