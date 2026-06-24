FactoryBot.define do
  factory :allergy do
    association :family_member
    name { Faker::Name.first_name }
    severity { "severe" }
    allergy_type { "MyString" }
  end
end
