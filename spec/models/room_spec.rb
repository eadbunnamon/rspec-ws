require 'rails_helper'

RSpec.describe Room, type: :model do
  context "relationships" do
    it { should belong_to(:hotel) }
    it { should belong_to(:room_type) }
  end

  context "validations" do
    it { should validate_presence_of(:number) }
    it { should validate_inclusion_of(:status).in_array(%w(available booked)) }
  end
end
