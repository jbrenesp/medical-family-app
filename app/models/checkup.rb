class Checkup < ApplicationRecord
  belongs_to :family_member

  validates :checkup_type, presence: true, inclusion: { in: %w[blood_test general dental vision other] }
  validates :date, presence: true
end
