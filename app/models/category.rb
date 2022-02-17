class Category < ApplicationRecord
    has_many :product
    enum status: { available: 0, unavailable: 1}
end
