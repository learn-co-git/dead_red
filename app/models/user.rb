class User < ApplicationRecord
  has_secure_password
  has_many :cards
  has_many :comments
end
