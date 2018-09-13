class Api::V1::Users::ItinerariesController < ApiController
  def create
    @new_itinerary = CreateWholeTrip.new(params[:id], itinerary_params)
    @new_itinerary.create_steps
    itinerary = @new_itinerary.itinerary
    possible_route = itinerary.possible_routes
    render json: possible_route
  end

  private

    def itinerary_params
      params.permit(:id, :start_address, :end_address, :departure_time, :arrival_time)
    end
end
