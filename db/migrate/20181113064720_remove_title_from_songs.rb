class RemoveTitleFromSongs < ActiveRecord::Migration[5.2]
  def change
    remove_column :songs, :title, :integer
  end
end
