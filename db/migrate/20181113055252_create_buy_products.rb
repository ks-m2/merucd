class CreateBuyProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :buy_products do |t|
      t.integer :count
      t.integer :price
      t.integer :buy_id
      t.integer :product_id

      t.timestamps
    end
  end
end
