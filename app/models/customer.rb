class Customer < ApplicationRecord
  rolify
  belongs_to :province

    # Add address attribute
    attr_accessor :address
    attr_accessor :province

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
end
