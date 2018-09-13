class UsersController < ApplicationController

  def create
    User.new(user_params)
  end


  private

  def user_params
    require(:user).permit(:email, :uid)
  end
end