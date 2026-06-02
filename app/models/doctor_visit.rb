class DoctorVisit < ApplicationRecord
  belongs_to :family_member
  belongs_to :illness

  validates :doctor_name, presence: true
  validates :visit_date, presence: true
  validates :visit_type, presence: true
end
