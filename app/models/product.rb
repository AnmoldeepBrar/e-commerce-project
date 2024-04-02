class Product < ApplicationRecord
  #has_one_attached :image
  belongs_to :category
  mount_uploader :image, ImageUploader

  attribute :on_sale, :boolean, default: false
  attribute :new, :boolean, default: false

  scope :search_by_keyword, ->(keyword) {
    where("title LIKE ? OR description LIKE ?", "%#{keyword}%", "%#{keyword}%")
  }

  scope :in_category, ->(category_id) {
    where(category_id: category_id)
  }
  
  # Define ransackable_associations method to specify associations that Ransack can search on
  def self.ransackable_associations(auth_object = nil)
    ["category"]
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[name description category_id]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[category]
  end

  # Define ransackable_attributes method to specify attributes that Ransack can search on
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "name", "price", "on_sale", "updated_at"]
  end
end

