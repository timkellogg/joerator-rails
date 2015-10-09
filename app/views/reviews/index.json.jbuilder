json.array!(@reviews) do |review|
  json.extract! review, :id, :user_id, :body, :title, :qualityRating, :hipsterRating, :studyRating, :laptopRating, :coffeeshop_id
  json.url review_url(review, format: :json)
end
