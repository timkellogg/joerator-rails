class Coffeeshop < ActiveRecord::Base
  has_many :reviews
  has_one  :menu

  validates_presence_of :name, 
                        :imageLink, :webAddress, 
                        :state, :city, 
                        :opens_at, :closes_at, 
                        :price, :parking, :style

  validates :state,    length:       { maximum: 2 }
  validates :price,    numericality: { less_than_or_equal_to: 5, greater_than: 0, only_integer: true }  
  validates :parking,  inclusion:    { :in => %w[lots some none]}
  validates :style,    inclusion:    { :in => %w[casual formal] }

  geocoded_by :full_address
  after_validation :geocode 

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
end

