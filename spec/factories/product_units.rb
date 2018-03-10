# == Schema Information
#
# Table name: product_units
#
#  id         :integer          not null, primary key
#  product_id :integer
#  rfid       :string
#  status     :integer          default("in_stock")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :product_unit do
    product
    rfid "MyString"
    status 0
  end
end
