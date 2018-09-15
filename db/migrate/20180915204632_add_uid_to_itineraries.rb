class AddUidToItineraries < ActiveRecord::Migration[5.2]
  def change
    add_column :itineraries, :uid, :string
  end
end
