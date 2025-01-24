require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:user) { User.create(email: 'test@example.com') }
  let(:category) { Category.create(name: 'Food') }

  describe 'validations' do
    subject { Transaction.new(user: user, is_paid: true, due_date: Time.current, category: category) }

    it { should validate_inclusion_of(:is_paid).in_array([true, false]) }
    it { should validate_presence_of(:due_date) }
    it { should validate_presence_of(:value) }
    it { should belong_to(:user) }
    it { should belong_to(:category) }
  end

  describe 'scopes' do
    let(:user2) { User.create(email: 'test2@example.com') }
    let!(:transaction1) { Transaction.create!(user: user, is_paid: true, due_date: DateTime.yesterday, category: category, value: 20) }
    let!(:transaction2) { Transaction.create!(user: user2, is_paid: false, due_date: DateTime.current, category: category, value: 30) }

    describe '.by_user' do
      it 'returns transactions for the current user' do
        expect(Transaction.by_user).to match_array([transaction1])
      end
    end

    describe '.total_spent' do
      it 'returns the total value of all transactions' do
        expect(Transaction.total_spent).to eq(50)
      end
    end

    describe '.total_paid' do
      it 'returns the total value of paid transactions' do
        expect(Transaction.total_paid).to eq(20)
      end
    end
  end
end
