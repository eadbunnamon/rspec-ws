require 'rails_helper'

RSpec.describe EncryptingService, type: :helper do
  context '.encrypt' do
    it "can encrypt text" do
      expect(EncryptingService.encrypt("secret!")).not_to eq("secret!")
    end
  end

  context '.decrypt' do
    it "can decrypt text" do
      encrypted_text = EncryptingService.encrypt("secret!")
      expect(EncryptingService.decrypt(encrypted_text)).to eq("secret!")
    end
  end
end