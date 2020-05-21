class Hotel < ApplicationRecord
  has_many :rooms

  validates :name, :address, presence: true
end
