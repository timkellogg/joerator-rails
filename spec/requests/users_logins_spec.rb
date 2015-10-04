require 'rails_helper'

RSpec.describe "UsersLogins", type: :feature do
	describe "when using invalid info to login" do 
		it 'should render the page with a flash message' do 
			visit login_path 
			click_button 'Log in'
			expect(page).to have_content('Invalid')
			visit root_path 
			expect(page).to_not have_content('Invalid')
		end
	end
end

