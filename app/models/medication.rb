class Medication < ApplicationRecord
  belongs_to :family_member
  belongs_to :illness

  validates :name, presence: true
  validates :start_date, presence: true
  validates :medication_type, presence: true
end
