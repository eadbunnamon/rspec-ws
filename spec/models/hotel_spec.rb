require 'rails_helper'

RSpec.describe Hotel, type: :model do
  context "relationships" do
    it { should have_many(:rooms) }
  end

  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
  end
end
