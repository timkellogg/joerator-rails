require 'rails_helper'

describe Item do 
  it { should belong_to :menu }

  it { should validate_presence_of   :name }
  it { should validate_uniqueness_of :name }
  it { should validate_length_of    :description }
  it { should validate_inclusion_of(:meal_type).in_array(%w[appetizer brunch breakfast lunch dinner holiday ]) }
  it { should validate_presence_of :meal_type    }
  it { should_not allow_value(0).for(:price)     }
  it { should_not allow_value(-1).for(:price)    } 
end
