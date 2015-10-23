require 'rails_helper'

describe CoffeeshopsHelper do 

  describe "#calculate_stars" do 
    before { @coffeeshop = FactoryGirl.create(:coffeeshop) }

    it "should print out zero by default" do  
      expect(calculate_stars(@coffeeshop)).to eq("")
    end

    it "should handle half-stars" do 
      @coffeeshop.update(overall_average: 3.5)
      expect(calculate_stars(@coffeeshop)).to eq("<i class=\"fa fa-star\"></i><i class=\"fa fa-star\"></i><i class=\"fa fa-star\"></i><i class=\"fa fa-star-half\"></i>")
    end
  end

end

