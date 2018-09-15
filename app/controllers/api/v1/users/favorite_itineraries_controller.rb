class Api::V1::Users::FavoriteItinerariesController < ApiController

  def create
    user = User.find_by(uid: params[:uid])
    itinerary = user.itineraries.find(params[:itinerary_id])
    itinerary.update(favorite: true)
    itinerary.update(favorite_params)
    render json: itinerary.possible_routes
  end

  def index
    user = User.find_by(uid: params[:uid])
    favorites = user.itineraries.where(favorite: true)
    render json: favorites
  end

  def show
    user = User.find_by(uid: params[:uid])
    favorite = user.itineraries.find(params[:itinerary_id])
    render json: favorite
  end

private

  def favorite_params
    params.require(:favorite).permit(:title)
  end

end
