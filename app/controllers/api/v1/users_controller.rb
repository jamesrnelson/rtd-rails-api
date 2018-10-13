class Api::V1::UsersController < ApplicationController

  def create
    user = User.create(user_params)
    render json: user
  end

  def show
    if User.find_by(uid: params[:uid]).present?
      info = GetUserInfo.new(params[:uid]).show_all
      render json: info
    else
      render status: 404
    end
  end

  private

  def user_params
    params.permit(:username, :email, :uid)
  end
end
