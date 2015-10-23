require 'rails_helper'

describe "registration management", :type => :feature do 
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
    
    it "should send one welcome email to the correct user with the subject" do
      ActionMailer::Base.deliveries.count.should == 1
      ActionMailer::Base.deliveries.first.to.should == ["user@example.com"]
      ActionMailer::Base.deliveries.first.subject.should == "Welcome to joerator!"
    end
	end

  # describe "when deleting their account" do 
  #   it "should allow the user to remove their account" do 
  #     user = FactoryGirl.create(:user)
  #     log_in(user)
  #     visit user_path(user)
  #     click_link "Edit Profile"
  #     click_link "Delete Account"
  #     page.accept_confirm
  #   end

  #   it "should send a cancelation email" do 

  #   end
  # end

end








