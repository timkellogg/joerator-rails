require 'rails_helper'

describe "when removing a review" do

  before do
    coffeeshop = FactoryGirl.create(:coffeeshop)
    @user = FactoryGirl.create(:user)
    review = Review.create(user: @user, body: "This is the body of the review",
                           title: "The title", qualityRating: 1, hipsterRating: 1,
                           studyRating: 1, laptopRating: 1, coffeeshop: coffeeshop)
    @admin = FactoryGirl.create(:admin)
    log_in @admin
    visit coffeeshop_path(coffeeshop)
  end

  it "lets sends an email to the user informing them that their review was deleted" do
    page.find('.fa-trash-o').click
    ActionMailer::Base.deliveries.first.subject.should == "Your Joerator email was removed by admin"
  end
end
