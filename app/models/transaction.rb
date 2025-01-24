class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :is_paid, inclusion: { in: [ true, false ] }
  validates :due_date, presence: true
  validates :value, presence: true

  scope :by_user, -> { where(user: User.first) }
  scope :total_spent, -> { sum(:value) }
  scope :total_paid, -> { where(is_paid: true).sum(:value) }
end
