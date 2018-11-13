class CreateCartProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_products do |t|
      t.integer :count
      t.integer :product_id
      t.integer :cart_id

      t.timestamps
    end
  end
end
