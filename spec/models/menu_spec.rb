require 'rails_helper'

RSpec.describe Menu, type: :model do
  it { should belong_to :coffeeshop }
end

