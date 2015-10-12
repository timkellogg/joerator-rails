require 'rails_helper'

# RSpec.describe Menu, type: :model do
describe Menu do 
  it { should belong_to :coffeeshop }
  it { should have_many :items      }
end

