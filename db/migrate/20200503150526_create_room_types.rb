class CreateRoomTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :room_types, id: :uuid do |t|
      t.string        :name
      t.text          :options

      t.timestamps
    end
  end
end
