class AddProductIdToOrderedProducts < ActiveRecord::Migration
  def up
    add_column :ordered_products, :product_id, :integer
  end

  def down
    remove_column :ordered_products, :product_id
  end
end
