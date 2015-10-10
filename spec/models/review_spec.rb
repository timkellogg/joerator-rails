require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should belong_to :user       }
  it { should belong_to :coffeeshop }

  it { should validate_presence_of :title }
  it { should validate_length_of   :title }

  it { should validate_presence_of :body }
  it { should validate_length_of   :body }

  it { should validate_presence_of :qualityRating }
  it { should validate_presence_of :studyRating   }
  it { should validate_presence_of :laptopRating  }
  it { should validate_presence_of :hipsterRating }

  it { should validate_numericality_of :qualityRating }
  it { should validate_numericality_of :studyRating   }
  it { should validate_numericality_of :laptopRating  }
  it { should validate_numericality_of :hipsterRating }

  before do 
    @user = User.create(name: "admin", email: "example_user@example.com", 
      password: "password", password_confirmation: "password", admin: true)

    @coffeeshop = Coffeeshop.create(name: "example", address: "123 Main Street", qualityRating: 10,
      studyRating: 12, laptopRating: 12, hipsterRating: 23, opens_at: Time.new(2015, 12, 12, 6), 
      closes_at: Time.new(2015, 12, 12, 18), price: 5, accepts_credit: true, parking: "lots", style: "formal",
      vegan_friendly: true, veggie_friendly: true, imageLink: "alisdnfasdf", webAddress: "http//example.com")

    @review = Review.create(user_id: @user.id, body: "This is the body", title: "This is the title",
      qualityRating: 1, hipsterRating: 2, studyRating: 3, laptopRating: 4, coffeeshop_id: @coffeeshop)
  end 

  describe "when saving a non-integer" do 
    it "should fail" do 
      expect(Review.create(user: @user, body: "words", 
        title: "title", qualityRating: 2, studyRating: 3, 
        laptopRating: 1, hipsterRating: 1.2, coffeeshop: @coffeeshop)).to_not be_valid
    end
  end

  describe "when saving a negative" do 
    it "should fail" do 
      expect(@review = Review.new(user_id: @user.id, body: "This is the body", title: "This is the title",
        qualityRating: 1, hipsterRating: 2, studyRating: 3, laptopRating: -1, coffeeshop_id: @coffeeshop)).to_not be_valid
    end
  end

end



 
