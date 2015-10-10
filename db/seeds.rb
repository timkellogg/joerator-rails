@admin = User.create(
  name: "admin",
  email: "admin@joerator.com",
  password: "password",
  password_confirmation: "password",
  admin: true
)

rand(10..40).times do |n|

  User.create(
    name: "regular#{n}",
    email: "user#{n}@joerator.com",
    password: "password",
    password_confirmation: "password",
  )

  Coffeeshop.create(
    name: Faker::Company.name,
    address: Faker::Address.street_address,
    qualityRating: rand(1..5),
    studyRating: rand(1..5),
    laptopRating: rand(1..5),
    hipsterRating: rand(1..5),
    opens_at: Time.new(2015, 12, 12, rand(6..10)),
    closes_at: Time.new(2015, 12, 12, rand(17..24)),
    price: rand(1..5),
    accepts_credit: [true, false].sample,
    parking: %w[lots some none].sample,
    style: %w[formal casual].sample,
    vegan_friendly: [true, false].sample,
    veggie_friendly: [true, false].sample,
    imageLink: "https://images.unsplash.com/photo-1428550443830-190057dc8098?q=80&fm=jpg&s=1b1da888b3a734385de61e95ab9ade15",
    webAddress: "http://coffeeshop#{n}.com",
    city: Faker::Address.city,
    state: Faker::Address.state_abbr
  )

  rand(1..10).times do
    review = Review.create(
      user_id: User.last.id,
      body: Faker::Lorem.sentence(rand(1..10)),
      title: Faker::Book.title,
      qualityRating: rand(1..5),
      studyRating: rand(1..5),
      laptopRating: rand(1..5),
      hipsterRating: rand(1..5),
      coffeeshop_id: Coffeeshop.last.id
    )

    review.coffeeshop.increment!("studyRating",   by = review.studyRating)
    review.coffeeshop.increment!("qualityRating", by = review.qualityRating)
    review.coffeeshop.increment!("laptopRating",  by = review.laptopRating)
    review.coffeeshop.increment!("hipsterRating", by = review.hipsterRating)
  end
end
