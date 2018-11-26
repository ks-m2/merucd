class AddDefaultDeletedAtFromUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :deleted_at, :integer, :default => 0
  end
end
