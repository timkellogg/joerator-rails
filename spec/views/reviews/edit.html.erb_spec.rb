require 'rails_helper'

RSpec.describe "reviews/edit", type: :view do
  before(:each) do
    @review = assign(:review, Review.create!(
      :user => nil,
      :body => "MyString",
      :title => "MyString",
      :qualityRating => 1,
      :hipsterRating => 1,
      :studyRating => 1,
      :laptopRating => 1,
      :coffeeshop => nil
    ))
  end

  it "renders the edit review form" do
    render

    assert_select "form[action=?][method=?]", review_path(@review), "post" do

      assert_select "input#review_user_id[name=?]", "review[user_id]"

      assert_select "input#review_body[name=?]", "review[body]"

      assert_select "input#review_title[name=?]", "review[title]"

      assert_select "input#review_qualityRating[name=?]", "review[qualityRating]"

      assert_select "input#review_hipsterRating[name=?]", "review[hipsterRating]"

      assert_select "input#review_studyRating[name=?]", "review[studyRating]"

      assert_select "input#review_laptopRating[name=?]", "review[laptopRating]"

      assert_select "input#review_coffeeshop_id[name=?]", "review[coffeeshop_id]"
    end
  end
end
