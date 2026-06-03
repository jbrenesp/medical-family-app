class Medication < ApplicationRecord
  belongs_to :family_member
  belongs_to :illness, optional: true

  validates :name, presence: true
  validates :start_date, presence: true
  validates :medication_type, presence: true
end
