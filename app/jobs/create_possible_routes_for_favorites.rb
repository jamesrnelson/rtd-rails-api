require 'sidekiq-scheduler'

class CreatePossibleRoutesForFavorites
  include Sidekiq::Worker

  def perform(*args)
    favorites = Itinerary.where(["favorite", true])
    favorites.each do |favorite|
      SequentialCalls.new(
        favorite.id,
        { start_address: favorite.start_address, end_address: favorite.end_address },
        "7:00am",
        1
      ).create_possible_routes
    end
  end
end
