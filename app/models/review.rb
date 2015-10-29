class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :coffeeshop

  validates :title, length: { maximum: 100 }
  validates :body,  length: { in: 10..255  }

  after_save :increment_count
  before_destroy :decrement_count

  def increment_count
    self.coffeeshop.increment!("reviews_count")
  end

  def decrement_count
    self.coffeeshop.decrement!("reviews_count")
  end

  # Prevents user from submitting multiple reviews to the same coffeeshop
  validates_uniqueness_of :user_id, :scope => [:coffeeshop_id]

  validates_presence_of :title, :body, :qualityRating, :studyRating, :laptopRating, :hipsterRating

  validates_numericality_of :qualityRating,:studyRating,:laptopRating, :hipsterRating,
     {
        less_than_or_equal_to: 5,
        greater_than: 0,
        only_integer: true
     }
end
