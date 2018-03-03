require 'rails_helper'

RSpec.describe "product_units/edit", type: :view do
  before(:each) do
    @product_unit = assign(:product_unit, FactoryBot.create(:product_unit))
  end

  it "renders the edit product_unit form" do
    render

    assert_select "form[action=?][method=?]", product_unit_path(@product_unit), "post" do

      assert_select "input[name=?]", "product_unit[product_id]"

      assert_select "input[name=?]", "product_unit[rfid]"

      assert_select "input[name=?]", "product_unit[status]"
    end
  end
end
