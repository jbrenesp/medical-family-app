require 'rails_helper'

RSpec.describe DoctorVisit, type: :model do
  describe 'associations' do
    it { should belong_to(:family_member) }
    it { should belong_to(:illness).optional }
  end

  describe 'validations' do
    it 'is invalid without a doctor_name' do
      doctor_visit = DoctorVisit.new(doctor_name: nil)
      expect(doctor_visit).not_to be_valid
    end

    it 'is invalid without a visit_date' do
      doctor_visit = DoctorVisit.new(visit_date: nil)
      expect(doctor_visit).not_to be_valid
    end

    it 'is invalid without a visit_type' do
      doctor_visit = DoctorVisit.new(visit_type: nil)
      expect(doctor_visit).not_to be_valid
    end

    it 'is valid with required fields' do
      family = Family.create(name: Faker::Name.last_name)
      family_member = FamilyMember.create(name: Faker::Name.first_name, member_type: 'adult', is_private: false, family: family)
      doctor_visit = DoctorVisit.new(doctor_name: Faker::Name.first_name, visit_date: Date.today, visit_type: 'checkup', family_member: family_member)
      expect(doctor_visit).to be_valid
    end
  end
end
