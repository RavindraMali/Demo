class AddAmoutToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :total_amount, :float, default: 0
  end
end
