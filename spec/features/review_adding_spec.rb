require 'rails_helper'

describe "when creating a new review", :type => :feature do 

  context "that is valid" do 

    describe "allows the user to fill out the form" do 
      before do 
        coffeeshop = FactoryGirl.create(:coffeeshop)
        user = FactoryGirl.create(:user)
        log_in user 
        visit coffeeshop_path(coffeeshop)
      end

      it "handles correct submissions", js: true, :type => :feature do 
        click_link "Add a review"
        fill_in 'Body', with: "This is the body of the review"
        fill_in "Title", with: "Title"
        fill_in "Coffee Quality", with: "1"
        fill_in "Hip Factor", with: "1"
        fill_in "Atmosphere", with: "1"
        fill_in "Amenities", with: "1"
        click_button "Submit review"
        expect(page).to have_content "Review was added successfully!"
        expect(page).to have_content "less than a minute ago"
      end
    end
  end

  context "that is invalid" do 
    describe "allows the user to fill out the form" do 
      before do 
        coffeeshop = FactoryGirl.create(:coffeeshop)
        user = FactoryGirl.create(:user)
        log_in user 
        visit coffeeshop_path(coffeeshop)
      end

      it "handles incorrect submissions", js: true, :type => :feature do 
        click_link "Add a review"
        fill_in 'Body', with: "short"
        fill_in "Title", with: ""
        fill_in "Coffee Quality", with: "11"
        fill_in "Hip Factor", with: "n"
        fill_in "Atmosphere", with: "-"
        fill_in "Amenities", with: "12"
        click_button "Submit review"
        expect(page).to_not have_content "Review was added successfully!"
        expect(page).to_not have_content "less than a minute ago"
      end
    end
  end
end

