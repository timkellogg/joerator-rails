require 'rails_helper'

RSpec.describe "coffeeshops/index", type: :view do
  before(:each) do
    assign(:coffeeshops, [
      Coffeeshop.create!(
        :name => "Name",
        :address => "Address",
        :qualityRating => 1,
        :studyRating => 2,
        :laptopRating => 3,
        :hipsterRating => 4,
        :imageLink => "Image Link",
        :webAddress => "Web Address"
      ),
      Coffeeshop.create!(
        :name => "Name",
        :address => "Address",
        :qualityRating => 1,
        :studyRating => 2,
        :laptopRating => 3,
        :hipsterRating => 4,
        :imageLink => "Image Link",
        :webAddress => "Web Address"
      )
    ])
  end

  it "renders a list of coffeeshops" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Image Link".to_s, :count => 2
    assert_select "tr>td", :text => "Web Address".to_s, :count => 2
  end
end
