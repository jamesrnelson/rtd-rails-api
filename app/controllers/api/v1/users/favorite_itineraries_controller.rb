class Api::V1::Users::FavoriteItinerariesController < ApiController

  def create
    binding.pry
    user = User.find(params[:uid])
    itinerary = user.itineraries.find(params[:itinerary_id])
    itinerary.update(favorite:true, favorite_params)
    @new_favorite = CreateFavoriteTrip.new(params[:itinerary_id], favorite_params)
    @new_favorite.create_steps
    favorite = @new_favorite.favorite
    possible_route = favorite.possible_routes
    render json: possible_route
    # this is where subsequent calls go
    # similar to create whole trip, associate all with this user
    # and flag all as favorite, with current title
  end

  def index
    user = User.find_by(id: params[:id])
    render json: user.possible_routes
  end

private

  def favorite_params
    params.require(:itinerary).permit(:title)
  end

end
# they will post the users/:uid/itinerary/itinerary_id
# favorites#create

# get users/:id/favorites
