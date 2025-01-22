class User < ApplicationRecord
  has_many :transactions
  validates :email, presence: true, uniqueness: true
end
