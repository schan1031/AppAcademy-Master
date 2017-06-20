class UsersController < ApplicationController

  

  def index
    @users = User.all
    render json: @users
  end

  def create
    user = User.new(params[:user].permit(:name, :email))
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @users = User.find_by(id: params[:id])
    if @users
      render json: @users
    else
      render json: ["ID does not exist."], status: 404
    end
  end

  def update
    user = User.find_by(id: params[:id])
    if user
      user.update_attributes(user_params)
      render json: user
    else
      render json: user.errors.full_messages, status: 400
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user
      user.destroy
      render json: user
    else
      render json: ['No user to destroy'], status: 404
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end



end
