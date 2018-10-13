class GetUserInfo
  attr_reader :user

  def initialize(user_id)
    @user = User.find_by(uid: user_id)
  end

  def show_all
    {
      user: user,
      favorites: get_favorites,
      recent_searches: get_recent_searches
    }
  end

  def get_recent_searches
    user.itineraries.where(favorite: false).last(5)
  end

  def get_favorites
    user.itineraries.where(favorite: true)
  end
end
