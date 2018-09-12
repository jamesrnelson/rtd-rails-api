class AddItineraryIdToPossibleRoutes < ActiveRecord::Migration[5.2]
  def change
    add_reference :possible_routes, :itinerary, foreign_key: true
  end
end
