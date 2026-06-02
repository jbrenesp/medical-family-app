require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should belong_to(:family).optional }
    it { should have_one(:family_member) }
  end

  describe 'validations' do
    it 'is invalid without an email' do
      user = User.new(email: nil, password: 'password123')
      expect(user).not_to be_valid
    end
  end

  describe 'before_destroy' do
    it 'prevents deletion if user has a family member' do
      family = Family.create(name: Faker::Name.last_name)
      user = User.create(email: Faker::Internet.email, password: 'password123', family: family)
      FamilyMember.create(name: Faker::Name.first_name, family: family, user: user, member_type: 'adult', is_private: false)
      expect { user.destroy }.not_to change { User.count }
    end

    it 'allows deletion if user has no family member' do
      family = Family.create(name: Faker::Name.last_name)
      user = User.create(email: Faker::Internet.email, password: 'password123', family: family)
      expect { user.destroy }.to change { User.count }.by(-1)
    end
  end
end
