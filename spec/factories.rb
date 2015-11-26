FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@example.com"}
    password "password"
    password_confirmation "password"

    factory :admin do
      admin true
    end
  end

  factory :coffeeshop do
    sequence(:name) { |n| "Example #{n} Coffeeshop"}
    webAddress "https://example_coffeeshop.com"
    state "CA"
    address "123 Main Street"
    city "Los Angeles"
    weekday_opens_at "8:00"
    weekday_closes_at "8:00"
    weekend_opens_at "10:00"
    weekend_closes_at "5:00"
    price 3
    parking "lots"
    style "casual"
    overall_average 0.0
    approved true
    phone "1234567890"

    factory :unseen do
      approved false
    end
  end

  factory :menu do
    coffeeshop
  end

  factory :item do
    name Faker::Lorem.word
    description Faker::Lorem.word
    meal_type "brunch"
    price 3
    menu
  end
end
