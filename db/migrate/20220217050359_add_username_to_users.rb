class AddUsernameToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :name, :username
    add_column :users, :date_of_birth, :datetime
    add_column :users, :is_female, :boolean, default: false

    add_index :users, :username, unique: true
  end
end
