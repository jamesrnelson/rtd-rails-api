class Api::V1::Users::FavoriteItinerariesController < ApiController

  def create
    # binding.pry
    user = User.find_by(uid: params[:uid])
    itinerary = user.itineraries.find(params[:itinerary_id])
    itinerary.update(favorite: true)
    itinerary.update(favorite_params)
    # binding.pry
    render json: itinerary.possible_routes
  end

  def index
    user = User.find_by(uid: params[:uid])
    # binding.pry
    favorites = user.itineraries.where(favorite: true)
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
    # binding.pry
    params.require(:favorite).permit(:title)
  end

end
# they will post the users/:uid/itinerary/itinerary_id
# favorites#create

# get users/:id/favorites
