class AddAmountToOrderProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :order_products, :amount, :float, default:0
  end
end