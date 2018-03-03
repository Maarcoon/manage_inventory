require 'rails_helper'

RSpec.describe "inventories/index", type: :view do
  before(:each) do
    assign(:inventories, [
      Inventory.create!(
        :closed => false
      ),
      Inventory.create!(
        :closed => false
      )
    ])
  end

  it "renders a list of inventories" do
    render
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
