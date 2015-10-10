class Coffeeshop < ActiveRecord::Base
  has_many :reviews
  has_one  :menu

  before_save { self.name = name.downcase }

  validates_presence_of 
    :name, :imageLink, :webAddress, :state, :city, 
    :opens_at, :closes_at, :price, :accepts_credit, 
    :parking, :style, :veggie_friendly, :vegan_friendly

  validates :state,    length: { maximum: 2 }
  validates :price,    numericality: { less_than_or_equal_to: 5, greater_than: 0, only_integer: true }  
  validates :parking,  inclusion:    { in: %w[lots some none]}
  validates :style,    inclusion:    { in: %w[casual formal] }

  def self.search(query)
    where("name like ?", "%#{query}%") 
  end
end
