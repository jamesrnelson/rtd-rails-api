class CreateItineraries < ActiveRecord::Migration[5.2]
  def change
    create_table :itineraries do |t|
      t.references :user, foreign_key: true
      t.string :start_address
      t.string :end_address

      t.timestamps
    end
  end
end
