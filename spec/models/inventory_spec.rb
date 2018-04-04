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

require 'rails_helper'

RSpec.describe Inventory, type: :model do
  subject { FactoryBot.build(:inventory) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  describe 'Associations' do
    it { should have_many(:inventory_items) }
  end

  describe 'Validations' do
    it "raises an error if there is already one inventory open" do
      expect(Inventory).to receive(:find_by_open).with(true).and_return(true)
      subject.valid?
      expect(subject.errors.full_messages).to include('Open Apenas 1 inventário pode ser aberto ao mesmo tempo.')
    end
  end


  describe '#closed?' do
    it 'return true if closed' do
      subject.open = false
      expect(subject.closed?).to eq(true)
    end

    it 'return false if open' do
      subject.open = true
      expect(subject.closed?).to eq(false)
    end
  end

  describe '#closed_date' do
    it 'return localized closed date when present' do
      closed_at = Time.now.utc
      subject.closed_at = closed_at
      expect(subject.closed_date).to eq(I18n.l(closed_at.to_date))
    end

    it 'return nothing when not present' do
      closed_at = nil
      subject.closed_at = closed_at
      expect(subject.closed_date).to eq(nil)
    end
  end

  describe 'Callbacks' do
    it 'generate items after create' do
      expect(ProductUnit).to receive(:in_stock).and_return([FactoryBot.create(:product_unit)])
      expect{subject.save}.to change{InventoryItem.count}.by(1)
    end
  end
end
