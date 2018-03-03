require 'rails_helper'

RSpec.describe "ProductUnits", type: :request do
  describe "GET /product_units" do
    it "works! (now write some real specs)" do
      get product_units_path
      expect(response).to have_http_status(200)
    end
  end
end
