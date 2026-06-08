class Family < ApplicationRecord
  has_many :family_members, dependent: :destroy
  has_many :users, dependent: :nullify

  validates :name, presence: true
end
