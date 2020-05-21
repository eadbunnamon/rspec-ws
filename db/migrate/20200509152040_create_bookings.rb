class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings, id: :uuid do |t|
      t.datetime        :start_at
      t.datetime        :end_at
      t.uuid            :room_id
      t.string          :booking_name
      t.text            :booking_number

      t.timestamps
    end
  end
end
