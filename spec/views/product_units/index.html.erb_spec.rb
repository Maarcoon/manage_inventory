require 'rails_helper'

RSpec.describe "product_units/index", type: :view do
  before(:each) do
    assign(:product_units, [
      FactoryBot.create(:product_unit, rfid: 'Rfid', status: 2),
      FactoryBot.create(:product_unit, rfid: 'Rfid', status: 2)
    ])
  end

  it "renders a list of product_units" do
    render
    assert_select "tr>td", :text => "Rfid".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
