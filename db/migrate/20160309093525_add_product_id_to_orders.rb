class AddProductIdToOrders < ActiveRecord::Migration
  def up
    add_column :orders, :product_id, :integer
  end

  def down
    remove_column :orders, :product_id
  end
end
