class StaticPagesController < ApplicationController

	def home 
    @coffeeshops = Coffeeshop.all.limit(3)
	end
end
