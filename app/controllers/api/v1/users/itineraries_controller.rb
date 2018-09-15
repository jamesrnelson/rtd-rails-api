class Api::V1::Users::ItinerariesController < ApiController

  def create
    user = User.find_by(uid: params[:uid])
    @new_itinerary = CreateWholeTrip.new(user.id, itinerary_params)
    @new_itinerary.create_steps
    itinerary = @new_itinerary.itinerary
    possible_route = itinerary.possible_routes
    render json: possible_route
  end

  def index
    user = User.find_by(uid: params[:uid])
    render json: user.possible_routes
  end

  private

    def itinerary_params
      params.permit(:id, :start_address, :end_address, :departure_time, :arrival_time)
    end
end
