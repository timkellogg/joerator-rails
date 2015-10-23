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
    name "Example Coffeeshop"
    webAddress "https://example_coffeeshop.com"
    state "CA"
    address "123 Main Street"
    city "Los Angeles"
    opens_at "8:00"
    closes_at "8:00"
    price 3
    parking "lots"
    style "casual"
    overall_average 0.0
  end

  factory :item do  
    name Faker::Lorem.word
    description Faker::Lorem.sentences(1)
    meal_type "brunch"
    price 3
  end
end
