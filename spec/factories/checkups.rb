FactoryBot.define do
  factory :checkup do
    family_member { nil }
    checkup_type { "MyString" }
    date { "2026-06-01" }
    results { "MyText" }
    notes { "MyText" }
  end
end
