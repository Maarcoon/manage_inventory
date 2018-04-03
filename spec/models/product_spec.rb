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

require 'rails_helper'

RSpec.describe Product, type: :model do
  subject { FactoryBot.build(:product) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  describe 'Associations' do
    it { should have_many(:product_units) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:code) }
  end

  describe '#code_name' do
    it 'concat code with name' do
      expect(subject.code_name).to eq 'Code - Name'
    end
  end
end
