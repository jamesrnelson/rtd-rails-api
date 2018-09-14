class UsersController < ApplicationController

  def create
    user = User.create(user_params)
    render json: user
  end


  private

  def user_params
    require(:user).permit(:username, :email, :uid)
  end
end
