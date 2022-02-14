class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :contact_person
      t.string :contact_number
      t.text :contact_address
      t.string :contact_email

      t.timestamps
    end
  end
end
