class Product < ApplicationRecord
  belongs_to :category
    enum status: { available: 0, unavailable: 1}

    mount_uploader :image, ImageUploader

    private
    def self.search(query)
      where("name LIKE ? OR title LIKE ?","%#{query}%","%#{query}%")
    end
end
