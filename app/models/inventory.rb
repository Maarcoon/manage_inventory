# == Schema Information
#
# Table name: inventories
#
#  id         :integer          not null, primary key
#  open       :boolean          default(TRUE)
#  closed_at  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Inventory < ApplicationRecord

  scope :open, -> { find_by_open(true) }
  scope :closed, -> { where(open: false) }

  has_many :inventory_items, dependent: :destroy

  after_create :generate_items

  def closed?
    !open?
  end

  def opened_date
    I18n.l(created_at.to_date)
  end

  def closed_date
    if closed_at
      I18n.l(closed_at.to_date)
    end
  end

  private

  def generate_items
    ProductUnit.in_stock.each do |product_unit|
      InventoryItem.create(product_unit: product_unit, inventory: self)
    end
  end
end
