module ReviewsHelper
  # Checks if a user has reviewed a coffeeshop
  def already_reviewed?(coffeeshop, user)
    coffeeshop.reviews.each do |review|
      return true if review.user == user
    end
    return false
  end
end
