class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms, id: :uuid do |t|
      t.string          :number
      t.uuid            :hotel_id
      t.uuid            :room_type_id
      t.string          :status,      default: 'available'
      t.string          :floor
      t.text            :detail

      t.timestamps
    end
  end
end
