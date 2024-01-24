FactoryBot.define do
  factory :user do
    name { Faker::Name.name  }
    age { Faker::Number.within(range: 1..100) }
    gender { User::BIOLOGICAL_SEX.sample }
    lat { Faker::Number.between(from:-90.0, to: 90.0) }
    lng { Faker::Number.between(from: -180.0, to: 180.0) }

    trait :infected do
      infected { true }
    end

    trait :with_item_x1 do
      after(:create) do |user|
        create(:user_item, user_id: user.id)
      end
    end

    trait :with_item_x5 do
      after(:create) do |user|
        create(:user_item, :x5, user_id: user.id)
      end
    end

    trait :with_item_x10 do
      after(:create) do |user|
        create(:user_item, :x10, user_id: user.id)
      end
    end
  end
end
