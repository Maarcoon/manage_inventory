# == Schema Information
#
# Table name: inventory_items
#
#  id              :integer          not null, primary key
#  inventory_id    :integer
#  product_unit_id :integer
#  status          :integer          default("missing")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe InventoryItem, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
