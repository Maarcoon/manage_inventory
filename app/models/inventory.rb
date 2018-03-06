# == Schema Information
#
# Table name: inventories
#
#  id         :integer          not null, primary key
#  closed     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Inventory < ApplicationRecord
end
