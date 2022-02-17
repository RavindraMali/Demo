class AddBannerImageToPages < ActiveRecord::Migration[6.0]
  def change
    add_column :pages, :bannerimage, :string, default: ""
  end
end
