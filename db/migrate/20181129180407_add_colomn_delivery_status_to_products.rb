class AddColomnDeliveryStatusToProducts < ActiveRecord::Migration[5.2]
  def change
  	  add_column :products, :delivery_status, :integer
  end
end
