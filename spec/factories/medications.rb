FactoryBot.define do
  factory :medication do
    family_member { nil }
    illness { nil }
    name { "MyString" }
    medication_type { "MyString" }
    start_date { "2026-06-01" }
    end_date { "2026-06-01" }
    notes { "MyText" }
  end
end
