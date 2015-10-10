class Coffeeshop < ActiveRecord::Base
  has_many :reviews
  before_save { self.name = name.downcase }

  validates :name,       presence: true, uniqueness: true
  validates :imageLink,  presence: true
  validates :webAddress, presence: true 
  validates :state,      presence: true, length: { maximum: 2 }
  validates :city,       presence: true 
  validates :opens_at,   presence: true
  validates :closes_at,  presence: true

  # Issues with it labeling everything as invalid 
  # validates_uri_existence_of :imageLink, :with =>
  #       /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix
 
  # searches through coffeeshops where name includes 
  def self.search(query)
    where("name like ?", "%#{query}%") 
  end
end

