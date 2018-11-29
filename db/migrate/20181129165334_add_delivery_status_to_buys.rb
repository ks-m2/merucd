class AddDeliveryStatusToBuys < ActiveRecord::Migration[5.2]
  def change
  	add_column :buys, :delivery_status, :integer
  end
end
