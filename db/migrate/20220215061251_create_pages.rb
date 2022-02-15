class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.string :title,              null: false, default: "new page"
      t.string :slug,               null: false, default: "/"
      t.text   :content,            null: false, defualt: ""
      t.timestamps
    end
  end
end
