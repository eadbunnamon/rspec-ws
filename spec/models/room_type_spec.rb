require 'rails_helper'

RSpec.describe RoomType, type: :model do
  context "relationships" do
    it { should have_many(:rooms) }
  end

  context "validations" do
    it { should validate_presence_of(:name) }
  end
end
