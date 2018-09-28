class Api::V1::Users::FavoriteItinerariesController < ApiController

  def create
    user = User.find_by(uid: params[:uid])
    itinerary = user.itineraries.find(params[:itinerary_id])
    itinerary.update(favorite: true)
    itinerary.update(favorite_params)
    render json: itinerary
  end

  def index
    user = User.find_by(uid: params[:uid])
    user_id = user.id
    favorites = user.itineraries.where(favorite: true)
    render json: favorites
  end

  def show
    user = User.find_by(uid: params[:uid])
    base_time = Time.zone.now.strftime("%l:%M%P")
    itinerary = Itinerary.find(params[:itinerary_id])
    SequentialCalls.new(
      itinerary.id,
      { start_address: itinerary.start_address, end_address: itinerary.end_address },
      base_time,
      4
    ).create_possible_routes
    favorite = user.possible_routes
      .joins(:itinerary)
      .where("possible_routes.itinerary_id = ?", [params[:itinerary_id]]).last(4)
    render json: favorite
  end

  def edit
    user = User.find_by(uid: params[:uid])
    favorite = user.itineraries.find(params[:itinerary_id])
    favorite.update(favorite_params)
    render json: favorite
  end

  def delete
    user = User.find_by(uid: params[:uid])
    itinerary = user.itineraries.find(params[:itinerary_id])
    itinerary.update(favorite: false)
    render json: itinerary.id
  end

private

  def favorite_params
    params.permit(:title)
  end

end
