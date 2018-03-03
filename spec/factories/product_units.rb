FactoryBot.define do
  factory :product_unit do
    product
    rfid "MyString"
    status 0
  end
end
