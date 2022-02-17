class RemoveStatusFromCategoriesAddDescriptionToCategories < ActiveRecord::Migration[6.0]
  def change
    remove_column :categories, :status, :string
    add_column :categories, :status, :integer, default: 0
    add_column :categories, :description, :text, default: ""
  end
end
