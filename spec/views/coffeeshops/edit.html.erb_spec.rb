require 'rails_helper'

RSpec.describe "coffeeshops/edit", type: :view do
  before(:each) do
    @coffeeshop = assign(:coffeeshop, Coffeeshop.create!(
      :name => "MyString",
      :address => "MyString",
      :qualityRating => 1,
      :studyRating => 1,
      :laptopRating => 1,
      :hipsterRating => 1,
      :imageLink => "MyString",
      :webAddress => "MyString"
    ))
  end

  it "renders the edit coffeeshop form" do
    render

    assert_select "form[action=?][method=?]", coffeeshop_path(@coffeeshop), "post" do

      assert_select "input#coffeeshop_name[name=?]", "coffeeshop[name]"

      assert_select "input#coffeeshop_address[name=?]", "coffeeshop[address]"

      assert_select "input#coffeeshop_qualityRating[name=?]", "coffeeshop[qualityRating]"

      assert_select "input#coffeeshop_studyRating[name=?]", "coffeeshop[studyRating]"

      assert_select "input#coffeeshop_laptopRating[name=?]", "coffeeshop[laptopRating]"

      assert_select "input#coffeeshop_hipsterRating[name=?]", "coffeeshop[hipsterRating]"

      assert_select "input#coffeeshop_imageLink[name=?]", "coffeeshop[imageLink]"

      assert_select "input#coffeeshop_webAddress[name=?]", "coffeeshop[webAddress]"
    end
  end
end
