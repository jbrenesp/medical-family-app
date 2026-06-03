require 'rails_helper'

RSpec.describe FamilyMember, type: :model do
  describe 'associations' do
    it { should belong_to(:family) }
    it { should belong_to(:user).optional }
    it { should have_many(:illnesses).dependent(:destroy) }
    it { should have_many(:doctor_visits).dependent(:destroy) }
    it { should have_many(:medications).dependent(:destroy) }
    it { should have_many(:allergies).dependent(:destroy) }
    it { should have_many(:vaccines).dependent(:destroy) }
    it { should have_many(:checkups).dependent(:destroy) }
  end

  describe 'validations' do
    it 'is invalid without a name' do
      family_member = FamilyMember.new(name: nil)
      expect(family_member).not_to be_valid
    end

    it 'is invalid without a member_type' do
      family_member = FamilyMember.new(member_type: nil)
      expect(family_member).not_to be_valid
    end

    it 'is invalid with an incorrect member_type' do
      family_member = FamilyMember.new(member_type: 'invalid')
      expect(family_member).not_to be_valid
    end

    it 'is valid with correct member_type adult' do
      family = Family.create(name: Faker::Name.last_name)
      family_member = FamilyMember.new(name: Faker::Name.first_name, member_type: 'adult', is_private: false, family: family)
      expect(family_member).to be_valid
    end
  end
end
