class CreateProductComments < ActiveRecord::Migration[5.2]
  def change
    create_table :product_comments do |t|
      t.string :product_id_integer
      t.integer :user_id
      t.string :content

      t.timestamps
    end
  end
end
