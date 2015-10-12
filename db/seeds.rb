# Create admin user
@user = User.create(
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

  User.create(
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
    qualityRating: rand(1..5),
    studyRating: rand(1..5),
    laptopRating: rand(1..5),
    hipsterRating: rand(1..5),
    opens_at: Time.new(2015, 12, 12, rand(17..24)),
    closes_at: Time.new(2015, 12, 12, rand(6..10)),
    price: rand(1..5),
    parking: ["lots", "some", "none"].sample,
    style: ["formal", "casual"].sample,
    imageLink: "https://images.unsplash.com/photo-1428550443830-190057dc8098?q=80&fm=jpg&s=1b1da888b3a734385de61e95ab9ade15",
    webAddress: "http://coffeeshop#{n}.com",
    city: Faker::Address.city,
    state: Faker::Address.state_abbr
  )

  Menu.create(coffeeshop: Coffeeshop.last)
  
  # build menu items
  rand(8..20).times do 
    Item.create!(
      menu: Menu.last,
      name: Faker::Lorem.name + "n",
      description: Faker::Lorem.words(3),
      vegan_friendly: [true, false].sample,
      veggie_friendly: [true, false].sample,   
      gluten_free: [true, false].sample, 
      meal_type: ["appetizer", "brunch", "breakfast", "lunch", "dinner", "holiday"].sample,
      image_link: %w[http://uchiblogo.uchicago.edu/sexy-science-coffee.jpg https://www.nespresso.com/ecom/medias/sys_master/public/9301705261086/Vertuoline_Coffee_Set_mobile_200x200.png
        http://3.bp.blogspot.com/_-BoFzR6biqk/TU-35do8oqI/AAAAAAAABMk/lgmVgRDOyIU/s1600/salad-sandwich-meal-plan-de-thumb-200x200-220806.jpg 
        http://static.caloriecount.about.com/images/medium/croissant-162239.jpg http://undercalories.com/foods/bagelwithbananaandpeanutbutter.jpg
        http://recipegreat.com/images/carrot-smoothie-04.jpg http://www.pcrm.org/sites/default/files/images/health/reports/breakfast.jpg ].sample,
      price: rand(1..24.99)
    )
  end

  rand(1..10).times do
    review = Review.create(
      user: User.last,
      body: Faker::Lorem.sentence(rand(1..10)),
      title: Faker::Book.title,
      qualityRating: rand(1..5),
      studyRating: rand(1..5),
      laptopRating: rand(1..5),
      hipsterRating: rand(1..5),
      coffeeshop: Coffeeshop.last
    )

    # have reviews relate to the ratings of the coffeeshop 
    review.coffeeshop.increment!("studyRating",   by = review.studyRating)
    review.coffeeshop.increment!("qualityRating", by = review.qualityRating)
    review.coffeeshop.increment!("laptopRating",  by = review.laptopRating)
    review.coffeeshop.increment!("hipsterRating", by = review.hipsterRating)
  end
end
