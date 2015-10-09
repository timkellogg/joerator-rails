json.array!(@coffeeshops) do |coffeeshop|
  json.extract! coffeeshop, :id, :name, :address, :qualityRating, :studyRating, :laptopRating, :hipsterRating, :imageLink, :webAddress
  json.url coffeeshop_url(coffeeshop, format: :json)
end
