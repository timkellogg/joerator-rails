class Coffeeshop < ActiveRecord::Base
  has_many :reviews
  has_one  :menu

  before_save { self.name = name.downcase }

  validates :name,            presence: true
  validates :imageLink,       presence: true
  validates :webAddress,      presence: true 
  validates :state,           presence: true, length: { maximum: 2 }
  validates :city,            presence: true 
  validates :opens_at,        presence: true
  validates :closes_at,       presence: true
  validates :price,           presence: true, numericality: { less_than_or_equal_to: 5, greater_than: 0, only_integer: true }  
  validates :accepts_credit,  presence: true
  validates :parking,         presence: true, inclusion:    { in: %w[lots some none]}
  validates :style,           presence: true, inclusion:    { in: %w[casual formal] }
  validates :vegan_friendly,  presence: true
  validates :veggie_friendly, presence: true

  def self.search(query)
    where("name like ?", "%#{query}%") 
  end
end
