FactoryBot.define do
  factory :vaccine do
    association :family_member
    name { Faker::Name.first_name }
    vaccine_date { "2026-06-01" }
  end
end
