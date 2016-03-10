class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :discount

      t.timestamps
    end
  end
end
