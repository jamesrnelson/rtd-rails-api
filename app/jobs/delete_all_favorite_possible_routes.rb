require 'sidekiq-scheduler'

class DeleteAllFavoritePossibleRoutes
  include Sidekiq::Worker

  def perform(*args)
    all_routes = PossibleRoute.joins(:itinerary).where(["itineraries.favorite = ?", true])
    all_routes.destroy_all
  end
end
