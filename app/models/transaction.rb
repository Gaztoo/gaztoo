class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :is_paid, presence: true
  validates :due_date, presence: true
  validates :value, presence: true
end
