require 'sidekiq-scheduler'

class DeleteExpiringPossibleRoutes
  include Sidekiq::Worker

  def perform(*args)
    expiring_routes = PossibleRoute.where(['created_at < ?', 30.days.ago])
    expiring_routes.destroy_all
  end
end
