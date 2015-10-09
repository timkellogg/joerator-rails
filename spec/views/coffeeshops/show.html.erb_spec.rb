require 'rails_helper'

RSpec.describe "coffeeshops/show", type: :view do
  before(:each) do
    @coffeeshop = assign(:coffeeshop, Coffeeshop.create!(
      :name => "Name",
      :address => "Address",
      :qualityRating => 1,
      :studyRating => 2,
      :laptopRating => 3,
      :hipsterRating => 4,
      :imageLink => "Image Link",
      :webAddress => "Web Address"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Image Link/)
    expect(rendered).to match(/Web Address/)
  end
end
