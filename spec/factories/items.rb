FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    points { Faker::Number.within(range: 1..10) }
  end
end
