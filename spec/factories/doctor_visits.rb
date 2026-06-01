FactoryBot.define do
  factory :doctor_visit do
    family_member { nil }
    illness { nil }
    doctor_name { "MyString" }
    doctor_city { "MyString" }
    visit_date { "2026-06-01" }
    notes { "MyText" }
    visit_type { "MyString" }
  end
end
