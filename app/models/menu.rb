class Menu < ActiveRecord::Base
  belongs_to :coffeeshop
  has_many   :items
end
