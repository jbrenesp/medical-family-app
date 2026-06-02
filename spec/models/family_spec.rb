require 'rails_helper'

RSpec.describe Family, type: :model do
  describe 'validations' do
    it 'is valid with a name' do
      family = Family.new(name: Faker::Name.last_name)
      expect(family).to be_valid
    end

    it 'is invalid without a name' do
      family = Family.new(name: nil)
      expect(family).not_to be_valid
    end
  end

  describe 'associations' do
    it { should have_many(:family_members).dependent(:destroy) }
    it { should have_many(:users) }
  end
end
