require 'rails_helper'
require_relative '../support/utilities'

describe "authorizations of the user", :type => :feature do 

  describe "when not logged in" do 
    it "the user cannot edit or delete coffeeshops" do  
      coffeeshop = FactoryGirl.create(:coffeeshop)
      visit coffeeshop_path(coffeeshop)
      expect(page).to_not have_content("Edit #{coffeeshop.name}")
      visit edit_coffeeshop_path(coffeeshop)
      expect(page).to have_content("ability")

    end
  end

  describe "when logged in not as the correct user" do 
    it "the user cannot edit or delete coffeeshops" do  
      coffeeshop = FactoryGirl.create(:coffeeshop)
      user = FactoryGirl.create(:user)
      log_in(user)

    end
  end
end

