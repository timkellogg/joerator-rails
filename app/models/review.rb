class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :coffeeshop

  validates :title, presence: true, length: { maximum: 100 }
  validates :body,  presence: true, length: { in: 10..255  }

  validates :qualityRating, presence: true, numericality: { less_than_or_equal_to: 5, greater_than: 0, only_integer: true }  
  validates :studyRating,   presence: true, numericality: { less_than_or_equal_to: 5, greater_than: 0, only_integer: true }  
  validates :laptopRating,  presence: true, numericality: { less_than_or_equal_to: 5, greater_than: 0, only_integer: true }  
  validates :hipsterRating, presence: true, numericality: { less_than_or_equal_to: 5, greater_than: 0, only_integer: true }    
end


