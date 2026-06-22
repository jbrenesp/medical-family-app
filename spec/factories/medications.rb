FactoryBot.define do
  factory :medication do
    association :family_member
    name { Faker::Name.first_name }
    medication_type { "MyString" }
    start_date { "2026-06-01" }
    end_date { "2026-06-01" }
  end
end
