require 'rails_helper'

RSpec.describe Booking, type: :model do
  before do
    @time_now = Time.zone.parse('2020-01-01 19:30:21')
    allow(Time).to receive(:now).and_return(@time_now)
  end

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
      expect(booking.start_at.to_datetime).to eq(@time_now)
    end
  end
end
