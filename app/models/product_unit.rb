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

class ProductUnit < ApplicationRecord
  belongs_to :product

  has_many :inventory_items, dependent: :destroy

  enum status: [ :in_stock, :sold, :lost, :provisory ]

  validates :product, :rfid, :status, presence: true
end
