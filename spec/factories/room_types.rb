FactoryBot.define do
  sequence(:type) { |n| "A[#{n}]" }
  factory :room_type do
    name { FactoryBot.generate(:type) }
    options { {bed: 'queen-sized'} }
  end
end
