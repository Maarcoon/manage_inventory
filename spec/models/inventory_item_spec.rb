# == Schema Information
#
# Table name: inventory_items
#
#  id              :integer          not null, primary key
#  inventory_id    :integer
#  product_unit_id :integer
#  status          :integer          default("missing")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe InventoryItem, type: :model do
  subject { FactoryBot.build(:inventory_item) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  describe 'Associations' do
    it { should belong_to(:inventory) }
    it { should belong_to(:product_unit) }
  end

  describe 'Enums' do
    it { should define_enum_for(:status) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:inventory) }
    it { should validate_presence_of(:product_unit) }
    it { should validate_presence_of(:status) }
  end
end
