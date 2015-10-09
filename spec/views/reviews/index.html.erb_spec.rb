require 'rails_helper'

RSpec.describe "reviews/index", type: :view do
  before(:each) do
    assign(:reviews, [
      Review.create!(
        :user => nil,
        :body => "Body",
        :title => "Title",
        :qualityRating => 1,
        :hipsterRating => 2,
        :studyRating => 3,
        :laptopRating => 4,
        :coffeeshop => nil
      ),
      Review.create!(
        :user => nil,
        :body => "Body",
        :title => "Title",
        :qualityRating => 1,
        :hipsterRating => 2,
        :studyRating => 3,
        :laptopRating => 4,
        :coffeeshop => nil
      )
    ])
  end

  it "renders a list of reviews" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Body".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
