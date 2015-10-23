require 'rails_helper'
require_relative '../support/utilities'

describe "authorizations", :type => :feature do 

  context "attempting to access privileged pages " do 
    describe "as non-admin" do 
      before do 
        @user = FactoryGirl.create(:user) 
        log_in(@user)
      end

      it "should prevent the user from seeing the page and redirect with a msg" do  
        expect(page).to_not have_content("Admin Dashboard")
      end
    end

    describe "as an admin" do 
      before do 
        @user = FactoryGirl.create(:admin)
        log_in(@user)
      end

      it "should allow the user to visit privileged pages" do 
        expect(page).to have_content("Admin Dashboard")
        click_link "Admin Dashboard"
        expect(page).to_not have_content("ability")
      end
    end
  end

  context "attempting to access coffeeshop resources" do 
    describe "when not logged in" do 
      it "does not allow the user to create a coffeeshop" do  
        visit new_coffeeshop_path
        expect(page).to have_content("ability")
      end

      it "does not allow the user to edit a coffeeshop" do  
        coffeeshop = FactoryGirl.create(:coffeeshop)
        visit coffeeshop_path(coffeeshop)
        expect(page).to_not have_content("Edit #{coffeeshop.name}")
        visit edit_coffeeshop_path(coffeeshop)
        expect(page).to have_content("ability")
      end

      it "does not allow the user to destroy a coffeeshop" do 
        coffeeshop = FactoryGirl.create(:coffeeshop)
        visit coffeeshop_path(coffeeshop)
        expect(page).to_not have_content("Remove?") 
      end
    end

    describe "when logged in but not as an admin" do 
      before do
        @coffeeshop = FactoryGirl.create(:coffeeshop) 
        user = FactoryGirl.create(:user) 
        log_in(user)
        visit new_coffeeshop_path(@coffeeshop)
      end

      it "does not allow the user to create a coffeeshop" do  
        expect(page).to have_content("ability")
      end

      it "does not allow the user to edit a coffeeshop" do  
        expect(page).to_not have_content("Edit #{@coffeeshop.name}")
      end

      it "does not allow the user to delete a coffeeshop" do  
        expect(page).to_not have_content("Remove?")
      end
    end

    describe "when logged in as and admin" do 
      before do 
        user = FactoryGirl.create(:admin)
        log_in(user)
      end

      it "does allow the user to create a coffeeshop" do  
        fill_in_coffeeshop_form
        expect(page).to_not have_content("errors")
        expect(Coffeeshop.count).to eq(1)
      end

      it "does allow the user to edit a coffeeshop" do 
        coffeeshop = FactoryGirl.create(:coffeeshop)
        visit coffeeshop_path(coffeeshop) 
        expect(page).to have_content("Edit #{coffeeshop.name}")
        click_link "Edit #{coffeeshop.name}"
        fill_in "Name", with: "New Name" 
        click_button "List shop"
        expect(page).to have_content("New Name")
        expect(page).to_not have_content("#{coffeeshop.name}")
        expect(Coffeeshop.count).to eq(1)
      end

      it "does allow the user to delete a coffeeshop" do  
        coffeeshop = FactoryGirl.create(:coffeeshop)
        visit coffeeshop_path(coffeeshop)
        expect(page).to have_content("Remove?")
      end
    end
  end

  context "attempting to access menu and item resources" do 
    describe "when not logged in" do  
      it "does not allow the user to create a menu" do 
        coffeeshop = FactoryGirl.create(:coffeeshop)
        visit coffeeshop_path(coffeeshop)
        expect(page).to_not have_content("Add a Menu")
        visit new_coffeeshop_menu_path(coffeeshop)
        expect(page).to_not have_content("Create")
        expect(page).to have_content("ability")
      end
    end

    describe "when logged in as an admin" do  
      before do 
        user = FactoryGirl.create(:admin)
        log_in(user)
        coffeeshop = FactoryGirl.create(:coffeeshop)
        visit coffeeshop_path(coffeeshop)
      end

      it "does allow the user to create a menu" do 
        coffeeshop = FactoryGirl.create(:coffeeshop)
        visit coffeeshop_path(coffeeshop)
        click_link "Add a Menu"
        click_button "Create?"
        expect(page).to have_content("Menu was added")
        click_link "Add an item"
        fill_in_item_form 
        expect(page).to_not have_content("errors")
        expect(Item.count).to eq(1)
      end

      it "does allow the user to edit a menu item" do 
        item = FactoryGirl.create(:item)
        # 
      end
    end
  end
end

