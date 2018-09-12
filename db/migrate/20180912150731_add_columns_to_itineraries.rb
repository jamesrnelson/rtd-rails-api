class AddColumnsToItineraries < ActiveRecord::Migration[5.2]
  def change
    add_column :itineraries, :favorite, :boolean, :default => false
    add_column :itineraries, :title, :string, :default => nil
  end
end
