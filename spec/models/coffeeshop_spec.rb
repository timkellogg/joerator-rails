require 'rails_helper'

RSpec.describe Coffeeshop, type: :model do
  it { should have_many :reviews }
  it { should have_one  :menu    }

  it { should validate_presence_of :name            }
  it { should validate_presence_of :imageLink       }
  it { should validate_presence_of :webAddress      }
  it { should validate_presence_of :city            }
  it { should validate_presence_of :state           }
  it { should validate_length_of   :state           } 
  it { should validate_presence_of :opens_at        } 
  it { should validate_presence_of :closes_at       }
  it { should validate_presence_of :price           }
  it { should validate_presence_of :accepts_credit  }
  it { should validate_presence_of :parking         }
  it { should validate_presence_of :style           }
  it { should validate_presence_of :vegan_friendly  }
  it { should validate_presence_of :veggie_friendly }

  it { should validate_numericality_of :price       }
  it { should_not allow_value(6).for(:price)        }
  it { should_not allow_value(-1).for(:price)       }
  it { should_not allow_value(1.1).for(:price)      }

  it { should validate_inclusion_of(:parking).in_array(%w[lots some none]) }
  it { should validate_inclusion_of(:style).in_array(%w[casual formal])    }
end

