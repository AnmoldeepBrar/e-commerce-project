class Admin < ApplicationRecord
    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 8 }, format: { with: /\A(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*()_+}{":;''?><])(?=.*[a-z])(?=.*[A-Z]).{8,}\z/, message: "must contain at least one digit, one uppercase letter, one lowercase letter, one symbol, and be at least 8 characters long" }
    validate :password_match

  def password_match
    if password != password_confirmation
        errors.add(:password_confirmation, "doesn't match Password")
    end
  end
end
