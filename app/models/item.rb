class Item < ActiveRecord::Base
  belongs_to :menu
  before_save { self.name = name.downcase  }

  validates_presence_of :name, :description, :meal_type, :image_link

  validates :name,         uniqueness: true 
  validates :description,  length: { maximum: 64 }
  validates :meal_type,    inclusion: { in: %w[appetizer brunch breakfast lunch dinner holiday] }

  validates :price, format:       { with: /\A\d+(?:\.\d{0,2})?\z/ }, 
                    numericality: { greater_than: 0 }
end

