require 'rails_helper'

RSpec.describe Coffeeshop, type: :model do
  
  it { should have_many :reviews }

  it { should validate_presence_of   :name }
  it { should validate_uniqueness_of :name }

  it { should validate_presence_of :imageLink  }
  it { should validate_presence_of :webAddress }


  # describe "when saving a imageLink" do 
  #   it "should have the correct format of a URL" do 
  #     expect(Coffeeshop.new(name: "example", address: "123 Main Street", qualityRating: 10,
  #     studyRating: 12, laptopRating: 12, hipsterRating: 23, opens_at: Time.new(2015, 12, 12, 6), 
  #     closes_at: Time.new(2015, 12, 12, 18), price: 5, accepts_credit: true, parking: "lots", style: "formal",
  #     vegan_friendly: true, veggie_friendly: true, imageLink: "https://www.google.com/", webAddress: "http//example.com")).to_not be_valid
  #   end
  # end

  it "opens_at should be in a valid time format" do 
    expect(@coffeeshop = Coffeeshop.new(name: "example_coffeeshop", address: "123 Main Street", qualityRating: 10,
      studyRating: 12, laptopRating: 12, hipsterRating: 23, opens_at: "asdfasd", 
      closes_at: Time.new(2015, 12, 12, 18), price: 5, accepts_credit: true, parking: "lots", style: "formal",
      vegan_friendly: true, veggie_friendly: true, imageLink: "http://www.example.com/", 
      webAddress: "http//example.com")).to be_valid
  end


end


  #   t.time     "opens_at"
  #   t.time     "closes_at"
  #   t.integer  "price"
  #   t.boolean  "accepts_credit",  default: true
  #   t.string   "parking"
  #   t.string   "style"
  #   t.boolean  "vegan_friendly",  default: false
  #   t.boolean  "veggie_friendly", default: false
  # end
