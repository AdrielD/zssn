FactoryBot.define do
  factory :user_item do
    user
    item
    amount { 1 }

    trait :x5 do
      amount { 5 }
    end

    trait :x10 do
      amount { 10 }
    end
  end
end
