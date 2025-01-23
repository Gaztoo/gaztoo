require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'validations' do
    user = User.new(email: 'test@example.com')
    category = Category.new(name: "Test Category")
    subject { Transaction.new(user: user, is_paid: true, due_date: Time.current, category: category) }

    it { should validate_presence_of(:is_paid) }
    it { should validate_presence_of(:due_date) }
    it { should validate_presence_of(:value) }
    it { should belong_to(:user) }
    it { should belong_to(:category) }
  end
end
