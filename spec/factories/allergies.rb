FactoryBot.define do
  factory :allergy do
    family_member { nil }
    name { "MyString" }
    severity { "MyString" }
    allergy_type { "MyString" }
    notes { "MyText" }
    diagnosed_date { "2026-06-01" }
  end
end
