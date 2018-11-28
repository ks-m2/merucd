class RenameColumnPortalFromDeliveries < ActiveRecord::Migration[5.2]
  def change
  	rename_column :deliveries, :portal, :postal
  end
end
