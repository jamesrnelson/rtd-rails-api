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
    user_id = user.id
    favorites = user.possible_routes.joins(:itinerary).where('itineraries.favorite = true')
    render json: favorites
  end

  def show
    user = User.find_by(uid: params[:uid])
    favorite = user.possible_routes.joins(:itinerary).find(params[:itinerary_id])
    render json: favorite
  end

  def edit
    user = User.find_by(uid: params[:uid])
    # binding.pry
    favorite = user.itineraries.find(params[:itinerary_id])
    favorite.update(favorite_params)
  end

private

  def favorite_params
    params.permit(:title)
  end

end
