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
      before do
        coffeeshop = FactoryGirl.create(:coffeeshop)
        user = FactoryGirl.create(:user)
        log_in(user)
        visit coffeeshop_path(coffeeshop)
      end

      it "should show the button to favorite" do
        expect(page).to have_content("Favorite")
      end

      it "should allow the user to favorite only once", js: true do
        click_link("Favorite")
        expect(page).to have_content "has been added to your favs"
        expect(page).to_not have_content "Favorite"
      end

      it "should list the coffeeshop names favorited on the user's profile" do
        coffeeshop = FactoryGirl.create(:coffeeshop)
        user = FactoryGirl.create(:user)
        favorite_coffeeshop(user, coffeeshop)
        visit user_path(user)
        expect(page).to have_content coffeeshop.name
      end
    end
  end
end
