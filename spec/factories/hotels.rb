FactoryBot.define do
  sequence(:hotel_name) { |n| "Hotel #{n}" }
  sequence(:hotel_address) { |n| "Hotel #{n} 111/#{1} KK 40000" }
  factory :hotel do
    name { FactoryBot.generate(:hotel_name) }
    address { FactoryBot.generate(:hotel_address) }
  end
end
