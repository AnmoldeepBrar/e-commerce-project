class Payment < ApplicationRecord
    belongs_to :order

    enum payment_method: { credit_card: 0, paypal: 1, cash: 2 }
  
    def self.ransackable_attributes(auth_object = nil)
      ["created_at", "id", "order_amount", "payment_method", "updated_at"]
    end
end
