class User < ApplicationRecord
  has_secure_password

  enum user_type: [:father, :believer]
  validates :email, presence: true, uniqueness: true
end
