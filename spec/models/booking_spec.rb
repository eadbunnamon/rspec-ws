require 'rails_helper'

RSpec.describe Booking, type: :model do
  let(:room) { FactoryBot.create(:room) }
  let(:booking) do
    FactoryBot.create(:booking, 
      room: room,
      start_at: Time.now, 
      end_at: Time.now + 1.year, 
      booking_name: "Siri Bunnamon", 
      booking_number: "A0001")
  end

  context "relationships" do
    it { should belong_to(:room) }
  end

  context "validations" do
    it { should validate_presence_of(:start_at) }
    it { should validate_presence_of(:end_at) }
    it { should validate_presence_of(:booking_name) }
    it { should validate_presence_of(:booking_number) }
  end

  context "before create" do
    it "encrypt booking number" do
      expect(EncryptingService.decrypt(booking.booking_number)).to eq("A0001")
    end
  end
end
