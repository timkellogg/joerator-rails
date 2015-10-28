class Assessment < ActiveRecord::Base
  belongs_to :user
  belongs_to :coffeeshop
end
