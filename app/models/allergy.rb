class Allergy < ApplicationRecord
  belongs_to :family_member

  validates :name, presence: true
  validates :allergy_type, presence: true
  validates :severity, presence: true, inclusion: { in: %w[mild moderate severe] }
end
