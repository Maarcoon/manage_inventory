# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string
#  code       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Product < ApplicationRecord
  has_many :product_units
end
