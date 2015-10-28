require 'rails_helper'

describe Review do
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

  it { should_not allow_value(-1).for(:qualityRating)  }
  it { should_not allow_value(6).for(:qualityRating)   }

  describe "when a user has already submitted a review for a coffeeshop" do
    it "does not let them submit another one" do
      user = FactoryGirl.create(:user)
      coffeeshop = FactoryGirl.create(:coffeeshop)
      review = Review.create(user: user, body: "This is the body of the review",
                             title: "The title", qualityRating: 1, hipsterRating: 1,
                             studyRating: 1, laptopRating: 1, coffeeshop: coffeeshop)
      another_review = Review.create(user: user, body: "This is the body of the review",
                             title: "The title", qualityRating: 1, hipsterRating: 1,
                             studyRating: 1, laptopRating: 1, coffeeshop: coffeeshop)
      expect(coffeeshop.reviews.count).to eq 1
    end
  end
end
