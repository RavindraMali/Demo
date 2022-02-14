class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :title
      t.text :description
      t.string :code
      t.string :manufacture_by
      t.string :status
      t.float :price
      t.integer :quantity
      t.timestamps
    end
  end
end
