# Create admin user
@user = User.create!(
  name: "admin",
  email: "admin@joerator.com",
  password: "password",
  password_confirmation: "password",
  admin: true,
  bio: Faker::Lorem.sentence(3),
  favorite_coffee: 'americano',
  location: "Portland",
  facebook_link: "https://www.facebook.com/admin_user",
  twitter_link: "https://twitter.com/admin_user",
  google_link: "https://googleplus/admin_user",
  instagram_link: "https://instagram.com/admin_user"
)

rand(10..40).times do |n|

  User.create!(
    name: "regular#{n}",
    email: "user#{n}@joerator.com",
    password: "password",
    password_confirmation: "password",
    bio: Faker::Lorem.sentence(rand(1..4)),
    favorite_coffee: %w[expresso americano latte black irish liquor chai].sample,
    location: Faker::Address.city,
    facebook_link: "https://www.facebook.com/user#{n}",
    twitter_link: "https://twitter.com/user#{n}",
    google_link: "https://googleplus/user#{n}",
    instagram_link: "https://instagram.com/user#{n}"
  )

  Coffeeshop.create!(
    name: Faker::Company.name,
    address: Faker::Address.street_address,
    opens_at: Time.new(2015, 12, 12, rand(17..24)),
    closes_at: Time.new(2015, 12, 12, rand(6..10)),
    price: rand(1..5),
    parking: ["lots", "some", "none"].sample,
    style: ["formal", "casual"].sample,
    webAddress: "http://coffeeshop#{n}.com",
    city: ["Portland", "Washington", "Los Angeles", "Denver"].sample,
    state: Faker::Address.state_abbr
  )

  Menu.create!(coffeeshop: Coffeeshop.last)

  rand(8..20).times do
    Item.create!(
      menu: Menu.last,
      name: Faker::Lorem.name + "n",
      description: Faker::Lorem.words(3),
      vegan_friendly: [true, false].sample,
      veggie_friendly: [true, false].sample,
      gluten_free: [true, false].sample,
      meal_type: ["appetizer", "brunch", "breakfast", "lunch", "dinner", "holiday"].sample,
      price: rand(1..24.99)
    )
  end

  review = Review.create!(
    user: User.last,
    body: Faker::Lorem.sentence(rand(5..10)),
    title: Faker::Book.title,
    qualityRating: rand(1..5),
    studyRating: rand(1..5),
    laptopRating: rand(1..5),
    hipsterRating: rand(1..5),
    coffeeshop: Coffeeshop.last
  )

  Coffeeshop.last.calculate_average_ratings
end
