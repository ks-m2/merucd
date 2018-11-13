class RemovePassFromUsers < ActiveRecord::Migration[5.2]
  def change
  	remove_column :users, :encrypted_password, :integer

  	add_column :users, :encrypted_password, :string, :default => ""
  	change_column_null :users, :encrypted_password, false, 0
  end

end