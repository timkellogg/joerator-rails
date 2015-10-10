class Coffeeshop < ActiveRecord::Base
  has_many :reviews
  before_save { self.name = name.downcase }

  validates :name,       presence: true, uniqueness: true
  validates :imageLink,  presence: true
  validates :webAddress, presence: true 

  # validate opens_at  (format)
  # validate closes_at (format)

  # Issues with it labeling everything as invalid 
  # validates_uri_existence_of :imageLink, :with =>
  #       /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix






end

