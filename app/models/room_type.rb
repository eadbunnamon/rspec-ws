class RoomType < ApplicationRecord
  has_many :rooms

  serialize :options, Hash

  validates :name, presence: true
end
