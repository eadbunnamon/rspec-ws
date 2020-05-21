FactoryBot.define do
  sequence(:room_number) { |n| "#{n}" }
  factory :room do
    number { FactoryBot.generate(:room_number) }
    floor { 2 }
    association :hotel
    association :room_type
  end
end
