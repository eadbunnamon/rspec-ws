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
      end_at: Time.now + 3.days, 
      booking_name: "Siri Bunnamon", 
      booking_number: "A0001")
  end

  let(:past_booking) {
    FactoryBot.create(:booking, 
      room: room,
      start_at: Time.now - 3.days, 
      end_at: Time.now - 1.day, 
      booking_name: "Siri Bunnamon", 
      booking_number: "A0002")
  }

  let(:upcoming_booking) {
    FactoryBot.create(:booking, 
      room: room,
      start_at: Time.now + 1.day, 
      end_at: Time.now + 3.days, 
      booking_name: "Siri Bunnamon", 
      booking_number: "A0003")
  }

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

  context "scope" do
    before do
      booking
      past_booking
      upcoming_booking
    end

    it "past" do
      expect(Booking.past).to match_array([past_booking])
    end

    it "staying" do
      expect(Booking.staying).to match_array([booking])
    end

    it "upcoming" do
      expect(Booking.upcoming).to match_array([upcoming_booking])
    end
  end
end
