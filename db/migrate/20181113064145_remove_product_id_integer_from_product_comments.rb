class RemoveProductIdIntegerFromProductComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :product_comments, :product_id_integer, :string
  end
end
