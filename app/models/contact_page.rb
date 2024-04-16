class ContactPage < ApplicationRecord
  validates :content, presence: true

    def self.ransackable_attributes(auth_object = nil)
        ["content", "created_at", "id", "id_value", "updated_at"]
        # Add any additional attributes here that you want to be searchable
      end
end
