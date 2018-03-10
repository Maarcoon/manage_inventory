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

require 'rails_helper'

RSpec.describe ProductUnit, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
