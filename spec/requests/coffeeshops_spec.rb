require 'rails_helper'

RSpec.describe "Coffeeshops", type: :request do
  describe "GET /coffeeshops" do
    it "works! (now write some real specs)" do
      get coffeeshops_path
      expect(response).to have_http_status(200)
    end
  end
end
