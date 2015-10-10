class Item < ActiveRecord::Base
  belongs_to :menu
  before_save { self.name = name.downcase  }

  validates :name,        presence: true, uniqueness: true 
  validates :description, presence: true, length: { maximum: 64 }
  validates :type,        presence: true, inclusion: { in: %w[appetizer brunch breakfast lunch dinner holiday] }
  validates :image_link,  presence: true 
  validates :price, format:       { with: /\A\d+(?:\.\d{0,2})?\z/ }, 
                    numericality: { greater_than: 0 }
end

