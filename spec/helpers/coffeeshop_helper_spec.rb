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

  describe "#favorited?" do
    before do
      @coffeeshop = FactoryGirl.create(:coffeeshop)
      @user = FactoryGirl.create(:user)
    end

    it "should return false by default" do
      expect(favorited?(@user, @coffeeshop)).to eq false
    end

    it "should return true if the user has favorited the coffeeshop" do
      @user.coffeeshops << @coffeeshop
      expect(favorited?(@user, @coffeeshop)).to eq true
    end
  end

end
