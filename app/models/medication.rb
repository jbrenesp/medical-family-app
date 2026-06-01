class Medication < ApplicationRecord
  belongs_to :family_member
  belongs_to :illness
end
