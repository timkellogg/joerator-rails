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
end
