require 'rails_helper'
require_relative '../support/utilities'

describe "session management", :type => :feature do 
	describe "when using invalid info to login" do 
		it 'should render the page with a flash message' do 
			visit login_path 
			click_button 'Log in'
			expect(page).to have_content('Invalid')
			visit root_path 
			expect(page).to_not have_content('Invalid')
		end
	end

  describe "when using valid info to login" do  
    it "should log the user in and redirect to user page with flash" do 
      user = FactoryGirl.create(:user)
      visit login_path
      fill_in "Email", with: user.email 
      fill_in "Password", with: user.password
      click_button 'Log in'
      expect(page).to have_content("#{user.name}")
    end
  end

  describe "when logging out" do  
    it "should have no errors, redirect_to main page and display message" do 
      user = FactoryGirl.create(:user)
      log_in user
      click_link "Log out"
      expect(page).to have_content("successfully")
    end
  end
end

