# == Schema Information
#
# Table name: product_units
#
#  id         :integer          not null, primary key
#  product_id :integer
#  rfid       :string
#  status     :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProductUnit < ApplicationRecord
  belongs_to :product
end
