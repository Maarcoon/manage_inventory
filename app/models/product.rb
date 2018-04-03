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
  has_many :product_units, dependent: :destroy

  validates :name, :code, presence: true

  def code_name
    "#{code} - #{name}"
  end
end
