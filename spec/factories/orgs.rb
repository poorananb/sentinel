FactoryGirl.define do
  factory :org do
    name { Faker::Company.name }
    code { Faker::Lorem.characters(5) }
  end
end
