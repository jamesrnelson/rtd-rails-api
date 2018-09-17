class Api::V1::Users::ItinerariesController < ApiController

  def create
    user = User.find_by(uid: params[:uid])
    @new_itinerary = CreateWholeTrip.new(user.id, itinerary_params)
    @new_itinerary.create_steps
    itinerary = @new_itinerary.itinerary
    base_time = itinerary.possible_routes[0].departure_time
    CreateOtherPossibleRoute.new(itinerary.id, itinerary_params, base_time, 15).create_steps
    possible_routes = itinerary.possible_routes
    updated_itinerary = Itinerary.find(itinerary.id)
    render json: updated_itinerary.possible_routes
  end

  def index
    user = User.find_by(uid: params[:uid])
    render json: user.possible_routes
  end

  private

    def itinerary_params
      params.permit(:uid, :start_address, :end_address, :departure_time, :arrival_time)
    end
end
