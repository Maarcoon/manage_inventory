require 'rails_helper'

RSpec.describe "product_units/new", type: :view do
  before(:each) do
    assign(:product_unit, ProductUnit.new(
      :product => nil,
      :rfid => "MyString",
      :status => 1
    ))
  end

  it "renders new product_unit form" do
    render

    assert_select "form[action=?][method=?]", product_units_path, "post" do

      assert_select "input[name=?]", "product_unit[product_id]"

      assert_select "input[name=?]", "product_unit[rfid]"

      assert_select "input[name=?]", "product_unit[status]"
    end
  end
end
