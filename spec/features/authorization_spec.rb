require 'rails_helper'
require_relative '../support/utilities'

describe "authorizations of the user", :type => :feature do 

  context "when not logged in" do 
    it "does not allow the user to create/edit a coffeeshop" do  
      coffeeshop = FactoryGirl.create(:coffeeshop)
      visit coffeeshop_path(coffeeshop)
      expect(page).to_not have_content("Edit #{coffeeshop.name}")
      visit edit_coffeeshop_path(coffeeshop)
      expect(page).to have_content("ability")
    end
  end

  context "when logged in but not as an admin" do 
    it "does not allow the user to create/edit a coffeeshop" do  
      coffeeshop = FactoryGirl.create(:coffeeshop)
      user = FactoryGirl.create(:user)
      log_in(user)
      visit coffeeshop_path(coffeeshop)
      expect(page).to_not have_content("Edit #{coffeeshop.name}")
    end
  end

  context "when logged in as and admin" do 
    it "does allow the user to create/edit a coffeeshop" do 
      user = FactoryGirl.create(:admin)
      log_in(user)
      coffeeshop = FactoryGirl.create(:coffeeshop)
      visit coffeeshop_path(coffeeshop) 
      expect(page).to have_content("Edit #{coffeeshop.name}")
    end
  end
end

