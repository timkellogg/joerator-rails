class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :coffeeshop

  validates :title, length: { maximum: 100 }
  validates :body,  length: { in: 10..255  }

  validates_presence_of 
    :title, :body, :qualityRating, :studyRating, 
    :laptopRating, :hipsterRating

  validates_numericality_of 
     :qualityRating,:studyRating,
     :laptopRating, :hipsterRating, 
     {
        less_than_or_equal_to: 5,
        greater_than: 0,
        only_integer: true
     }
end


