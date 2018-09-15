class CreateFavoriteTrips < CreateWholeTrip


  def initialize(user_id, attrs)
    @user_id = attrs[:id]
    binding.pry
  end

end