class Product < ApplicationRecord
  belongs_to :category
    enum status: { available: 0, unavailable: 1}

    mount_uploader :image, ImageUploader
end
