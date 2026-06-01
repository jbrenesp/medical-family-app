FactoryBot.define do
  factory :illness do
    family_member { nil }
    name { "MyString" }
    start_date { "2026-06-01" }
    end_date { "2026-06-01" }
    notes { "MyText" }
  end
end
