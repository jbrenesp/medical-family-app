FactoryBot.define do
  factory :vaccine do
    family_member { nil }
    name { "MyString" }
    vaccine_date { "2026-06-01" }
    next_due_date { "2026-06-01" }
    dose_number { 1 }
    notes { "MyText" }
  end
end
