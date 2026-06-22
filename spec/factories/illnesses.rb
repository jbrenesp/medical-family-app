FactoryBot.define do
  factory :illness do
    association :family_member
    name { Faker::Name.first_name }
    start_date { "2026-06-01" }
  end
end
