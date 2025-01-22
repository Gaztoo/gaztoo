require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { User.new(email: 'test@example.com') }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end
end
