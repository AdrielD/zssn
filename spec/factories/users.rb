FactoryBot.define do
  factory :user do
    name { Faker::Name.name  }
    age { Faker::Number.within(range: 1..100) }
    gender { User::BIOLOGICAL_SEX.sample }
    lat { Faker::Number.between(from:-90.0, to: 90.0) }
    lng { Faker::Number.between(from: -180.0, to: 180.0) }
  end
end
