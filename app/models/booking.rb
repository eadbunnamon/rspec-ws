class Booking < ApplicationRecord
  belongs_to :room

  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :booking_name, presence: true
  validates :booking_number, presence: true

  scope :past, -> { where("end_at::date < ?", Time.now.to_date) }
  scope :staying, -> { where("start_at::date <= :today AND end_at::date >= :today", today: Time.now.to_date) }
  scope :upcoming, -> { where("start_at::date > ?", Time.now.to_date) }

  before_create :encrypt_booking_number

  private

  def encrypt_booking_number
    self.booking_number = EncryptingService.encrypt(booking_number)
  end
end
