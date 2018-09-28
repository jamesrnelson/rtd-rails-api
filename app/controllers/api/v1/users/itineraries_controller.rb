class Api::V1::Users::ItinerariesController < ApiController

  def create
    user = User.find_by(uid: params[:uid])
    @new_itinerary = CreateWholeTrip.new(user.id, itinerary_params)
    @new_itinerary.create_steps
    itinerary = @new_itinerary.itinerary
    base_time = itinerary.possible_routes[0].departure_time
    SequentialCalls.new(itinerary.id, itinerary_params, base_time, 3).create_possible_routes
    updated_itinerary = Itinerary.find(itinerary.id)
    render json: updated_itinerary.possible_routes
  end

  def index
    user = User.find_by(uid: params[:uid])
    amount = params[:amount]
    recent_itineraries = user.itineraries.where("favorite = false").last(amount)
    render json: recent_itineraries
  end

  private

    def itinerary_params
      params.permit(:uid, :start_address, :end_address, :departure_time, :arrival_time)
    end
end
