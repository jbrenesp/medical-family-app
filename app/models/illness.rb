class Illness < ApplicationRecord
  belongs_to :family_member

  has_many :doctor_visits, dependent: :destroy
  has_many :medications, dependent: :destroy

  validates :name, presence: true
  validates :start_date, presence: true
end
