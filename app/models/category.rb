class Category < ApplicationRecord
    has_many :products

    def self.ransackable_attributes(auth_object = nil)
      ["created_at", "description", "id", "name", "updated_at"]
      # Add any additional attributes here that you want to be searchable
    end
    
    def self.ransackable_associations(auth_object = nil)
        ["products"]
      end
end
