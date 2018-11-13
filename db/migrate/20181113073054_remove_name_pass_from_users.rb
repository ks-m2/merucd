class RemoveNamePassFromUsers < ActiveRecord::Migration[5.2]
  def change
  	remove_column :users, :email, :string
  	remove_column :users, :encrypted_password, :integer

  	add_column :users, :email, :string, {default: ""}
  	change_column_null :users, :email, false, 0

  	add_column :users, :encrypted_password, :integer, {default: ""}
  	change_column_null :users, :encrypted_password, false, 0
  end
end