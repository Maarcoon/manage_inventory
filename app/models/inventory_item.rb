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

class InventoryItem < ApplicationRecord
  belongs_to :inventory
  belongs_to :product_unit

  enum status: [ :missing, :found ]
end
