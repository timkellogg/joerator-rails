module CoffeeshopsHelper
  # retrieves the aggregate ratings for coffeeshop

  def get_ratings(coffeeshop)
    @review_total  = coffeeshop.reviews.all.count
    @quality_total = 0
    @study_total   = 0
    @hipster_total = 0
    @laptop_total  = 0
    
    coffeeshop.reviews.each do |review| 
      @quality_total += review.qualityRating
      @study_total   += review.studyRating
      @hipster_total += review.hipsterRating
      @laptop_total  += review.laptopRating
    end
    byebug 

    return ratings = {
            total: @review_total, 
            quality_total: (@quality_total/@review_total),
            study_total: @study_total/@review_total, 
            hipster_total: @hipster_total/@review_total, 
            laptop_total: @laptop_total/@review_total,
          }
  end

  def get_average_rating(ratings)
    (ratings[:quality_total] + ratings[:study_total] +
     ratings[:hipster_total] + ratings[:laptop_total])/4
  end
end
