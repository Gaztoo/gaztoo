require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { described_class.new(name: "Test Category") }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end
