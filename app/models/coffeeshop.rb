class Coffeeshop < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  has_one  :menu
  has_and_belongs_to_many :users

  validates_presence_of :name,
                        :webAddress,
                        :state, :city,
                        :opens_at, :closes_at,
                        :price, :parking, :style

  validates :state,    length:       { maximum: 2 }
  validates :price,    numericality: { less_than_or_equal_to: 5, greater_than: 0, only_integer: true }
  validates :parking,  inclusion:    { :in => %w[lots some none]}
  validates :style,    inclusion:    { :in => %w[casual formal] }

  validate :picture_size

  # Default paginate for will_paginate
  def self.per_page
    10
  end

  # Determines the average coffeeshop rating on categories
  def calculate_average_ratings
    total_reviews = self.reviews.count

    quality_total = 0
    study_total   = 0
    laptop_total  = 0
    hipster_total = 0

    self.reviews.each { |review| quality_total += review.qualityRating }
    self.reviews.each { |review| study_total   += review.studyRating   }
    self.reviews.each { |review| laptop_total  += review.laptopRating  }
    self.reviews.each { |review| hipster_total += review.hipsterRating }

    if total_reviews > 0
      self.average_hipster = hipster_total / total_reviews
      self.average_study   = study_total   / total_reviews
      self.average_laptop  = laptop_total  / total_reviews
      self.average_quality = quality_total / total_reviews
      self.overall_average = (average_hipster + average_study + average_laptop + average_quality)/4
    end
    self.save
  end

  # Convert addresses into latitude and longitude in production
  geocoded_by :full_address 
  after_validation :geocode if Rails.env.production?

  # File uploading
  mount_uploader :picture, PictureUploader

  def full_address
    return "#{address} #{city} #{state}"
  end

  # In future versions, raw SQL will be replaced.
  # However, AR does not support OR natively in a clean way
  def self.search(query)
    where("name like ?", "%#{query}%")
  end

  def self.search_location(query)
    where("state= ? OR city= ?", "#{query}", "#{query}")
  end

  private

    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5M")
      end
    end
end
