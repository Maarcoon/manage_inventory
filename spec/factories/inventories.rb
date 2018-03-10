# == Schema Information
#
# Table name: inventories
#
#  id         :integer          not null, primary key
#  closed_at  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :inventory do
    closed_at nil
  end
end
