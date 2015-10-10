require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should validate_presence_of :qualityRating }
end
