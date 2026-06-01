class AddDetailsToFamilyMembers < ActiveRecord::Migration[8.1]
  def change
    add_column :family_members, :date_of_birth, :date
    add_column :family_members, :member_type, :string
    add_column :family_members, :is_private, :boolean
    add_column :family_members, :blood_type, :string
  end
end
