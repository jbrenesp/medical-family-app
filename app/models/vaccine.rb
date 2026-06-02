class Vaccine < ApplicationRecord
  belongs_to :family_member

  validates :name, presence: true
  validates :vaccine_date, presence: true
end
