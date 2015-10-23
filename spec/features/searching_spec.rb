require 'rails_helper'
require_relative '../support/utilities'

describe "searching coffeeshops", :type => :feature do 

  context "when visting the highest rated" do 
    before do 
      @highly_rated = FactoryGirl.create(:coffeeshop)
      @highly_rated.update(overall_average: 5)
      @medium_rated = FactoryGirl.create(:coffeeshop)
      @medium_rated.update(overall_average: 3)
      @lowly_rated = FactoryGirl.create(:coffeeshop)
      @lowly_rated.update(overall_average: 1)
      visit root_path
    end

    it "should order the results from highest to lowest rated" do  
      click_link "Highest Rated"  
      @highly_rated.name.should appear_before(@medium_rated.name)
      @medium_rated.name.should appear_before(@lowly_rated.name)
    end
  end

  context "when visting the newest editions" do 
    before do 
      @most_recent = FactoryGirl.create(:coffeeshop)
      @most_recent.update(created_at: Time.new("2015"))
      @medium_recent = FactoryGirl.create(:coffeeshop)
      @medium_recent.update(created_at: Time.new("2014"))
      @least_recent = FactoryGirl.create(:coffeeshop)
      @least_recent.update(created_at: Time.new("2013"))
      visit root_path
    end

    it "should order the results by most recent" do 
      click_link "Newest Edition"
      @most_recent.name.should appear_before(@medium_recent.name)
      @medium_recent.name.should appear_before(@least_recent.name)
    end
  end

  context "when searching by state or city" do 
    before do 
      @match = FactoryGirl.create(:coffeeshop)
      @match.update(city: "Match")
      @mismatch = FactoryGirl.create(:coffeeshop)
      @mismatch.update(city: "Mismatch")
      visit root_path
    end

    it "should list only those that apply" do 
      fill_in "search_location", with: "Match"
      click_button "search-location-btn"
      expect(page).to have_content "Your search returned"
      expect(page).to have_content "Not Satisfied?"
      expect(page).to have_content @match.name
      expect(page).to_not have_content @mismatch.name
    end
  end

  context "when searching by name" do 
    before do 
      @match = FactoryGirl.create(:coffeeshop)
      @match.update(name: "Match")
      @mismatch = FactoryGirl.create(:coffeeshop)
      @mismatch.update(name: "Mismatch")
      visit root_path
    end 

    it "should list only those that apply" do 
      fill_in "search", with: "Match"
      click_button "search-name-btn"
      expect(page).to have_content @match.name
      expect(page).to_not have_content @mismatch.name
    end
  end
end

