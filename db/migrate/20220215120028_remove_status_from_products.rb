class RemoveStatusFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :status, :string
  end
end
