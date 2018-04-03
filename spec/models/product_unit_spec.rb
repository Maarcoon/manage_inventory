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
  subject { FactoryBot.build(:product_unit) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  describe 'Associations' do
    it { should belong_to(:product) }
    it { should have_many(:inventory_items) }
  end

  describe 'Enums' do
    it { should define_enum_for(:status) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:product) }
    it { should validate_presence_of(:rfid) }
    it { should validate_presence_of(:status) }
  end
end
