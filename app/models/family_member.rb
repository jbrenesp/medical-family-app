class FamilyMember < ApplicationRecord
  belongs_to :family
  belongs_to :user, optional: true

  has_many :illnesses, dependent: :destroy
  has_many :doctor_visits, dependent: :destroy
  has_many :medications, dependent: :destroy
  has_many :allergies, dependent: :destroy
  has_many :vaccines, dependent: :destroy
  has_many :checkups, dependent: :destroy

  validates :name, presence: true
  validates :member_type, presence: true, inclusion: { in: %w[adult child pet] }
  validates :is_private, inclusion: { in: [ true, false ] }
end
