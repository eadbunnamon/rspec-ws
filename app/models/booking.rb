class Booking < ApplicationRecord
  belongs_to :room

  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :booking_name, presence: true
  validates :booking_number, presence: true

  before_create :encrypt_booking_number

  private

  def encrypt_booking_number
    self.booking_number = EncryptingService.encrypt(booking_number)
  end
end
