class Address < ApplicationRecord

    def to_s
        "#{self.street1},#{self.street2},#{self.city},#{self.state},#{self.country}-#{self.pincode}"
    end
end
