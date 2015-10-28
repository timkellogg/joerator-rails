require 'rails_helper'

describe Assessment do
  it { should belong_to :user }
  it { should belong_to :coffeeshop }
end
