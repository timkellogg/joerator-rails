require 'rails_helper'

describe Coffeeshop do
  it { should have_many :reviews }
  it { should have_one  :menu    }
  it { should have_and_belong_to_many :users }

  it { should validate_presence_of :name            }
  it { should validate_presence_of :webAddress      }
  it { should validate_presence_of :city            }
  it { should validate_presence_of :state           }
  it { should validate_length_of   :state           }
  it { should validate_presence_of :opens_at        }
  it { should validate_presence_of :closes_at       }
  it { should validate_presence_of :price           }
  it { should validate_presence_of :parking         }
  it { should validate_presence_of :style           }
  it { should validate_presence_of :phone           }
  it { should validate_length_of   :phone           }

  it { should_not allow_value(6).for(:price)        }
  it { should_not allow_value(-1).for(:price)       }

  it { should validate_inclusion_of(:parking).in_array(%w[lots some none]) }
  it { should validate_inclusion_of(:style).in_array(%w[casual formal])    }

  describe "#fulladdress" do
    it "should return the address, state and street combined" do
      coffeeshop = FactoryGirl.create(:coffeeshop)
      expect(coffeeshop.full_address).to eq("123 Main Street Los Angeles CA")
    end
  end

  describe "when a new coffeeshop is created" do
    it "should at first be unapproved" do
      coffeeshop = FactoryGirl.create(:unseen)
      expect(coffeeshop.approved?).to eq false
    end
  end
end
