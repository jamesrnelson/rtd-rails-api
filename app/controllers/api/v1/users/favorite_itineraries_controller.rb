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
    favorites = user.itineraries.where(favorite: true)
    fav_trips = favorites.each do |fav|
      CreateWholeTrip.new(user_id, fav)
    end
    render json: favorites
  end

  def show
    user = User.find_by(uid: params[:uid])
    favorite = user.itineraries.find(params[:itinerary_id])
    # binding.pry
    render json: favorite
  end

private

  def favorite_params
    params.require(:favorite).permit(:title)
  end

end
# they will post the users/:uid/itinerary/itinerary_id
# favorites#create

# get users/:id/favorites
