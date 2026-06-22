FactoryBot.define do
  factory :doctor_visit do
    association :family_member
    doctor_name { Faker::Name.first_name }
    visit_date { "2026-06-01" }
    visit_type { "visit type" }
  end
end
