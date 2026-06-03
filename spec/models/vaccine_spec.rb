require 'rails_helper'

RSpec.describe Vaccine, type: :model do
  describe 'associations' do
    it { should belong_to(:family_member) }
  end

  describe 'validations' do
    it 'is invalid without a name' do
      vaccine = Vaccine.new(name: nil)
      expect(vaccine).not_to be_valid
    end

    it 'is invalid without a vaccine_date' do
      vaccine = Vaccine.new(vaccine_date: nil)
      expect(vaccine).not_to be_valid
    end

    it 'is valid with required fields' do
      family = Family.create(name: Faker::Name.last_name)
      family_member = FamilyMember.create(name: Faker::Name.first_name, member_type: 'adult', is_private: false, family: family)
      vaccine = Vaccine.new(name: Faker::Lorem.word, vaccine_date: Date.today, family_member: family_member)
      expect(vaccine).to be_valid
    end
  end
end
