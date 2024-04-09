class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_items, dependent: :destroy
    has_one :payment
    # has_many :products, through: :order_items

    validates :total_amount, presence: true


    enum status: { created: 0, placed: 1, paid: 2, cancel: 3 }
    enum payment_method: { online_payment: 0, cash_on_delivery: 1 }

    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "customer_id", "id", "payment_method", "status", "total_amount", "updated_at"]
    end

    def self.ransackable_associations(auth_object = nil)
        ["customer", "order_items", "payment", "products"]
    end

end
