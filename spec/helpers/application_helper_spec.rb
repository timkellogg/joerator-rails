require 'rails_helper'

describe ApplicationHelper do
  describe "#friendly_bool" do
    it "should convert true into yes" do
      expect(friendly_bool(true)).to eq "Yes"
    end

    it "should convert false into no" do
      expect(friendly_bool(false)).to eq "No"
    end
  end

  describe "#friendly_phone_number" do
    it "should convert string to standard (123) 456-7890 format" do
      expect(friendly_phone_number('1234567890')).to eq '(123) 456-7890'
    end
  end
end
