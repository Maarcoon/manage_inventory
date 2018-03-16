# == Schema Information
#
# Table name: inventories
#
#  id         :integer          not null, primary key
#  closed_at  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Inventory < ApplicationRecord
  def open?
    closed_at.blank?
  end

  def closed?
    closed_at.present?
  end

  def opened_date
    I18n.l(created_at.to_date)
  end

  def closed_date
    if closed_at
      I18n.l(closed_at.to_date)
    end
  end
end
