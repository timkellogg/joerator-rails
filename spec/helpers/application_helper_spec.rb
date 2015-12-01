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

  describe "#convert_state_initials" do
    it "should convert state full names into initials" do
      expect(convert_state_initials("California")).to eq "CA"
    end

    it "should return the string if not a state name" do
      expect(convert_state_initials("Bob")).to eq "Bob"
    end
  end
end
