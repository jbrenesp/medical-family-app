FactoryBot.define do
  factory :checkup do
    association :family_member
    checkup_type { "general" }
    date { "2026-06-01" }
  end
end
