class Adddefault < ActiveRecord::Migration[5.2]
  def change
	 change_column :products, :user_id, :integer, :default => ""
  	 change_column :products, :genre, :integer, :default => ""
  	 change_column :products, :status, :integer, :default => ""
  	 change_column :products, :image_id, :text, :default => ""
  	 change_column :products, :label, :string, :default => ""
  	 change_column :products, :artist, :string, :default => ""
  	 change_column :products, :album, :string, :default => ""
  	 change_column :products, :count, :integer , :default => ""
  	 change_column :products, :introduction, :text, :default => ""
  	 change_column :products, :price, :integer, :default => ""
  	 change_column :products, :new_price, :integer, :default => ""


  end
end
