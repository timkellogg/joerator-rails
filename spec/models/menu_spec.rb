require 'rails_helper'

RSpec.describe Menu, type: :model do
  it { should belong_to :coffeeshop }
  it { should have_many :items      }
end

