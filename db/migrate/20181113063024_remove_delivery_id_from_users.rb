class RemoveDeliveryIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :delivery_id, :integer
  end
end
