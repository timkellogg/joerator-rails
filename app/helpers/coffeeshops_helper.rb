module CoffeeshopsHelper
  def get_ratings(coffeeshop)
    review_total = coffeeshop.reviews.count

    return ratings =
      {
        quality_total: coffeeshop.qualityRating/review_total,
        study_total:   coffeeshop.studyRating/review_total,
        laptop_total:  coffeeshop.laptopRating/review_total,
        hipster_total: coffeeshop.hipsterRating/review_total
      }
  end

  def get_average_rating(ratings)
    (ratings[:quality_total] + ratings[:study_total] +
     ratings[:hipster_total] + ratings[:laptop_total])/4
  end
end
