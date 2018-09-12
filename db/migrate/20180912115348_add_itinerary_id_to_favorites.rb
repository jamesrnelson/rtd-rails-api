class AddItineraryIdToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_reference :favorites, :itinerary, foreign_key: true
  end
end
