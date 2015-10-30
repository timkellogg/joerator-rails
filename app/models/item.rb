class Item < ActiveRecord::Base
  belongs_to :menu
  before_save { self.name = name.downcase  }

  validates_presence_of :name, :description, :meal_type

  after_save :increment_item_count
  before_destroy :decrement_item_count

  def increment_item_count
    self.menu.coffeeshop.increment!("items_count")
  end

  def decrement_item_count
    self.menu.coffeeshop.decrement!("items_count")
  end

  # File uploading 
  mount_uploader :picture, PictureUploader

  validates :description,  length: { maximum: 64 }
  validates :meal_type,    inclusion: { in: %w[appetizer brunch breakfast lunch dinner holiday] }

  validates :price, format:       { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0 }

  validate :picture_size
  
  private 
    def picture_size
      if picture.size > 5.megabytes 
        errors.add(:picture, "should be less than 5M")
      end
    end
end

