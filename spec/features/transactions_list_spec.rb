require 'rails_helper'

RSpec.feature 'Transactions list', type: :feature do
  let(:user) { User.create(email: 'test@example.com') }
  let(:category) { Category.create(name: 'Food') }
  let!(:transaction1) { Transaction.create!(user: user, is_paid: true, due_date: DateTime.yesterday, category: category, value: 20) }
  let!(:transaction2) { Transaction.create!(user: user, is_paid: false, due_date: DateTime.current, category: category, value: 30) }

  context 'when there are transactions' do
    before do
      visit transactions_path(start_date: DateTime.yesterday, end_date: DateTime.now)
    end

    scenario 'displays transactions and totals correctly' do
      expect(page).to have_content('Despesas: 50')
      expect(page).to have_content('Total pago: 20')
      expect(page).to have_content(transaction1.id)
      expect(page).to have_content(transaction2.id)
    end
  end

  context 'when there are no transactions' do
    before do
      visit transactions_path(start_date: DateTime.now.next_week(:monday), end_date: DateTime.now.next_week(:tuesday))
    end

    scenario 'displays a message and totals as zero' do
      expect(page).to have_content('Despesas: 0')
      expect(page).to have_content('Total pago: 0')
      expect(page).to have_content('Nenhuma despesa cadastrada neste período')
      expect(page).not_to have_content(transaction1.id)
      expect(page).not_to have_content(transaction2.id)
    end
  end
end
