class User < ApplicationRecord
  has_many :bucketlists
  has_many :tokens

  has_secure_password

  VALID_EMAIL = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :firstname, :lastname, presence: true

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: VALID_EMAIL }

  validates :password,
            presence: true,
            length: { minimum: 5 }

  def full_name
    "#{firstname} #{lastname}"
  end
end
