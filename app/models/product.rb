class Product < ApplicationRecord
    enum status: { available: 0, unavailable: 1}

    mount_uploader :image, ImageUploader
end
