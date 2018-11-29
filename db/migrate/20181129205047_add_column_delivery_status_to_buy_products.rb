class AddColumnDeliveryStatusToBuyProducts < ActiveRecord::Migration[5.2]
  def change
  	 add_column :buy_products, :delivery_status, :integer
  end
end
