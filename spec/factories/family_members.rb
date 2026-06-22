FactoryBot.define do
  factory :family_member do
    association :family
    user { nil }
    name { Faker::Name.first_name }
    member_type { "adult" }
    date_of_birth { Faker::Date.birthday(min_age: 18, max_age: 65) }
    blood_type { "A+" }
    is_private { false }
  end
end
