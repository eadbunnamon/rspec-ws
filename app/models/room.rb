class Room < ApplicationRecord
  belongs_to :hotel
  belongs_to :room_type

  validates :number, presence: true
  validates_inclusion_of :status, in: %w(available booked)
end
