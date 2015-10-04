require 'rails_helper'

RSpec.describe "UsersSignups", type: :feature do

	describe "when passing in invalid information" do 
		it "should return errors and render current page" do 
			visit signup_path
			fill_in "Name",         with: " "
			fill_in "Email",        with: "aslknf"
			fill_in "Password",     with: "pass"
			fill_in "Confirmation", with: "asdfa"
			click_button "Create my account"
			expect(page).to have_content("errors")
		end
	end

	describe "when passing in valid information" do  
		it "should save the user to the database and redirect to profile" do 
			visit signup_path
			fill_in "Name",         with: "Example User"
			fill_in "Email",        with: "user@example.com"
			fill_in "Password",     with: "password"
			fill_in "Confirmation", with: "password"
			click_button "Create my account"
			expect(page).to_not have_content("errors")
		end
	end
end
