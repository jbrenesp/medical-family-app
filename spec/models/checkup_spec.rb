require 'rails_helper'

RSpec.describe Checkup, type: :model do
  describe 'associations' do
    it { should belong_to(:family_member) }
  end

  describe 'validations' do
    it 'is invalid without a date' do
      checkup = Checkup.new(date: nil)
      expect(checkup).not_to be_valid
    end

    it 'is invalid without a checkup_type' do
      checkup = Checkup.new(checkup_type: nil)
      expect(checkup).not_to be_valid
    end

    it 'is invalid with incorrect checkup_type' do
      checkup = Checkup.new(checkup_type: 'blood_general')
      expect(checkup).not_to be_valid
    end

    it 'is valid with required fields' do
      family = Family.create(name: Faker::Name.last_name)
      family_member = FamilyMember.create(name: Faker::Name.first_name, member_type: 'adult', is_private: false, family: family)
      checkup = Checkup.new(checkup_type: 'general', date: Date.today, family_member: family_member)
      expect(checkup).to be_valid
    end
  end
end
