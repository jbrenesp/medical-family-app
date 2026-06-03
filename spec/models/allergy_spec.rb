require 'rails_helper'

RSpec.describe Allergy, type: :model do
  describe 'associations' do
    it { should belong_to(:family_member) }
  end

  describe 'validations' do
    it 'is invalid without a name' do
      allergy = Allergy.new(name: nil)
      expect(allergy).not_to be_valid
    end

    it 'is invalid without a severity' do
      allergy = Allergy.new(severity: nil)
      expect(allergy).not_to be_valid
    end

    it 'is invalid without an allergy_type' do
      allergy = Allergy.new(allergy_type: nil)
      expect(allergy).not_to be_valid
    end

    it 'is invalid with incorrect severity' do
      allergy = Allergy.new(severity: 'extreme')
      expect(allergy).not_to be_valid
    end

    it 'is valid with required fields' do
      family = Family.create(name: Faker::Name.last_name)
      family_member = FamilyMember.create(name: Faker::Name.first_name, member_type: 'adult', is_private: false, family: family)
      allergy = Allergy.new(name: Faker::Lorem.word, allergy_type: 'food', severity: 'moderate', family_member: family_member)
      expect(allergy).to be_valid
    end
  end
end
