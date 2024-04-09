class Payment < ApplicationRecord
    belongs_to :order

    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "id", "order_amount", "payment_method", "updated_at"]
    end
end
