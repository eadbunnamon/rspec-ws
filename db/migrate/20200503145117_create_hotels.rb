class CreateHotels < ActiveRecord::Migration[5.1]
  def change
    create_table :hotels, id: :uuid do |t|
      t.string        :name
      t.text          :address

      t.timestamps
    end
  end
end
