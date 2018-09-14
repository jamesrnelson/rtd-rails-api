class Api::V1::Users::FavoriteItinerariesController < ApiController

  def create
    user = User.find(params[:id])
    itinerary = user.itineraries.find(params[:itinerary_id])
    itinerary.update(favorite:true, favorite_params)
    # this is where subsequent calls go
    # similar to create whole trip, associate all with this user
    # and flag all as favorite, with current title
  end
end


private

  def favorite_params
    params.require(:itinerary).permit(:title)
  end

end
# they will post the users/:uid/itinerary/itinerary_id
# favorites#create

# get users/:id/favorites
