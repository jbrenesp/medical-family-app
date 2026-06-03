require 'rails_helper'

RSpec.describe Illness, type: :model do
  describe 'associations' do
    it { should belong_to(:family_member) }
    it { should have_many(:doctor_visits).dependent(:destroy) }
    it { should have_many(:medications).dependent(:destroy) }
  end

  describe 'validations' do
    it 'is invalid without a name' do
      illness = Illness.new(name: nil)
      expect(illness).not_to be_valid
    end

    it 'is invalid without a start_date' do
      illness = Illness.new(start_date: nil)
      expect(illness).not_to be_valid
    end

    it 'is valid with a name and start_date' do
      family = Family.create(name: Faker::Name.last_name)
      family_member = FamilyMember.create(name: Faker::Name.first_name, member_type: 'adult', is_private: false, family: family)
      illness = Illness.new(name: Faker::Lorem.word, start_date: Date.today, family_member: family_member)
      expect(illness).to be_valid
    end
  end
end
