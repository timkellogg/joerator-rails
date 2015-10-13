require 'rails_helper'

describe Coffeeshop do
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
  it { should validate_presence_of :parking         }
  it { should validate_presence_of :style           }

  it { should_not allow_value(6).for(:price)        }
  it { should_not allow_value(-1).for(:price)       }

  it { should validate_inclusion_of(:parking).in_array(%w[lots some none]) }
  it { should validate_inclusion_of(:style).in_array(%w[casual formal])    }

  describe "#fulladdress" do 
    it "should return the address, state and street combined" do 
      @coffeeshop = Coffeeshop.create!(
        name: "Coffeeshop", address: "1600 Pennsylvania Avenue", 
        qualityRating: 0, studyRating: 0, laptopRating: 0, hipsterRating: 0, opens_at: Time.new(2015, 12, 12),
        closes_at: Time.new(2015, 12, 12), price: 4, parking: "lots", style: "casual", 
        imageLink: "https://images.unsplash.com/photo-1428550443830-190057dc8098?q=80&fm=jpg&s=1b1da888b3a734385de61e95ab9ade15",
        webAddress: "https://coffeeshop.com", city: "Washington DC", state: "District of Columbia"
        )
      expect(@coffeeshop.full_address).to eq("1600 Pennsylvania Avenue Washington DC District of Columbia")
    end
  end
end

