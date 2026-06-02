class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :family, optional: true
  has_one :family_member

  validates :email, presence: true


  before_destroy :check_for_family_members

  private

  def check_for_family_members
    if family_member.present?
      throw :abort
    end
  end
end
