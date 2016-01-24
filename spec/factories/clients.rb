FactoryGirl.define do
  factory :client do
    org { build_stubbed(:org) }
    name { Faker::Company.name }
    code { Faker::Lorem.characters(5) }
  end
end