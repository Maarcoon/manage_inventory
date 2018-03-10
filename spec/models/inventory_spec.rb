# == Schema Information
#
# Table name: inventories
#
#  id         :integer          not null, primary key
#  closed_at  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Inventory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
