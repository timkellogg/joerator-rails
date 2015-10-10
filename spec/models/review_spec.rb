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

  describe "when saving a non-integer" do 
    it "should fail" do 
      expect(Review.create(user: @user, body: "words", 
        title: "title", qualityRating: 2, studyRating: 3, 
        laptopRating: 1, hipsterRating: 1.2, coffeeshop: @coffeeshop)).to_not be_valid
    end
  end

  describe "when saving a negative" do 
    it "should fail" do 
      expect(@review = Review.new(user: @user, body: "This is the body", title: "This is the title",
        qualityRating: 1, hipsterRating: 2, studyRating: 3, laptopRating: -1, coffeeshop_id: @coffeeshop)).to_not be_valid
    end
  end
end



 
