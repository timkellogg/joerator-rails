IMAGES = %w[https://images.unsplash.com/photo-1441757801704-6a71cffed732?q=80&fm=jpg&s=e1a6ec9d58206d2a53ab532540347d4a 
            https://images.unsplash.com/photo-1442411210769-b95c4632195e?q=80&fm=jpg&s=1a35c4070c61332f5bffcf19b804e8e8
            https://images.unsplash.com/photo-1421986598195-0d9c26ecfcde?q=80&fm=jpg&s=f4c1618634322aecc17fbeb78bdf528b
            https://images.unsplash.com/photo-1428550443830-190057dc8098?q=80&fm=jpg&s=1b1da888b3a734385de61e95ab9ade15].sample(1)

@admin = User.create(
  name: "admin",
  email: "admin@joerator.com",
  password: "password",
  password_confirmation: "password",
  admin: true
)

# 5.times do |n| 
#   User.create(
#     name: "regular#{n}",
#     email: "user#{n}@joerator.com",
#     password: "password",
#     password_confirmation: "password",
#   )
# end

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
    webAddress: "http://coffeeshop#{n}.com"
  )

  rand(1..10).times do 
    Review.create(
      user_id: User.last.id,
      body: Faker::Lorem.sentence(rand(1..10)),
      title: Faker::Book.title,
      qualityRating: rand(1..5),
      studyRating: rand(1..5),
      laptopRating: rand(1..5),
      hipsterRating: rand(1..5),
      coffeeshop_id: Coffeeshop.last.id
      )
  end

end

