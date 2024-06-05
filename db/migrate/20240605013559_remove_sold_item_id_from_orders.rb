class RemoveSoldItemIdFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :sold_item_id, :integer
  end
end
