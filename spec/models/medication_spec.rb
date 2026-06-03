require 'rails_helper'

RSpec.describe Medication, type: :model do
  describe 'associations' do
    it { should belong_to(:family_member) }
    it { should belong_to(:illness).optional }
  end

  describe 'validations' do
    it 'is invalid without a name' do
      medication = Medication.new(name: nil)
      expect(medication).not_to be_valid
    end

    it 'is invalid without a start_date' do
      medication = Medication.new(start_date: nil)
      expect(medication).not_to be_valid
    end

    it 'is invalid without a medication_type' do
      medication = Medication.new(medication_type: nil)
      expect(medication).not_to be_valid
    end

    it 'is valid with required fields' do
      family = Family.create(name: Faker::Name.last_name)
      family_member = FamilyMember.create(name: Faker::Name.first_name, member_type: 'adult', is_private: false, family: family)
      medication = Medication.new(name: Faker::Lorem.word, start_date: Date.today, medication_type: 'vitamins', family_member: family_member)
      expect(medication).to be_valid
    end
  end
end
