require 'rails_helper'

describe ReviewsHelper do


  describe "#already_reviewed?" do
    before do
      @user = FactoryGirl.create(:user)
      @coffeeshop = FactoryGirl.create(:coffeeshop)
    end

    it "should return false before a user has submitted a review" do
      expect(already_reviewed?(@coffeeshop, @user)).to eq false
    end

    it "should return true after a user has submitted a review" do
      Review.create(user: @user, body: "This is the body of the review",
                   title: "The title", qualityRating: 1, hipsterRating: 1,
                   studyRating: 1, laptopRating: 1, coffeeshop: @coffeeshop)
      expect(already_reviewed?(@coffeeshop, @user)).to eq true
    end
  end
end
