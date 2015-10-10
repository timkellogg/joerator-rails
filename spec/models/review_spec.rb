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

  it { should_not allow_value(1.1).for(:qualityRating) }
  it { should_not allow_value(-1).for(:qualityRating)  }
  it { should_not allow_value(6).for(:qualityRating)   }

  it { should validate_numericality_of :qualityRating }
  it { should validate_numericality_of :studyRating   }
  it { should validate_numericality_of :laptopRating  }
  it { should validate_numericality_of :hipsterRating }

end



 
