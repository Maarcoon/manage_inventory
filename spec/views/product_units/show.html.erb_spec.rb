require 'rails_helper'

RSpec.describe "product_units/show", type: :view do
  before(:each) do
    @product_unit = assign(:product_unit, FactoryBot.create(:product_unit, rfid: 'Rfid', status: 2))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Rfid/)
    expect(rendered).to match(/2/)
  end
end
