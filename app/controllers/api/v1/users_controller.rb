<<<<<<< HEAD
class Api::V1::UsersController < ApplicationController
=======
class Api::V1::Users::UsersController < ApplicationController
>>>>>>> changes name of users controller

  def create
    user = User.create(user_params)
    render json: user
  end

  def show
    user = User.find_by(uid: params[:uid])
    render json: user
  end

  private

  def user_params
    params.permit(:username, :email, :uid)
  end
end
