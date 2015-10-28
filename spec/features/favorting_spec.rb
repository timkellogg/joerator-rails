require 'rails_helper'

describe "favorting" do

  context "as a non-logged in user" do
    describe "when visiting the page" do
      before do
        coffeeshop = FactoryGirl.create(:coffeeshop)
        visit coffeeshop_path(coffeeshop)
      end
      it "should not show the button to favorite a coffeeshop" do
        expect(page).to_not have_content("Favorite")
      end
    end
  end

  context "as a logged in user" do
    describe "when having not favorited the item before" do

      it "should show the button to favorite" do
      end

      it "should allow the user to favorite" do
      end

    end

    describe "when having favorited the item before" do

      it "should not show the button" do
      end

      it "should not allow the relationship to be created" do
      end
    end
  end

end
