require 'rails_helper'

describe "when removing a user's account" do 

  context "as the user" do 
    describe "on their profile page" do 
      before do 
        user = FactoryGirl.create(:user)
        log_in user
        visit edit_user_path(user)
      end

      it "deletes their account", js: true do 
        click_link("Delete Account")
        expect(page).to have_content "removed"
      end

      it "sends an email to the user informing them that their account was deleted" do
        ActionMailer::Base.deliveries.last.subject.should == "Your Joerator account has been removed."
      end
    end 
  end

  context "as an admin user" do 

  end
end
