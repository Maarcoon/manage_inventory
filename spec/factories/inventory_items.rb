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

FactoryBot.define do
  factory :inventory_item do
    inventory nil
    product_unit nil
    status 1
  end
end
