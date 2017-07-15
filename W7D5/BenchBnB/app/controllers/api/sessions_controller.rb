class Api::SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if @user
      log_in(@user)
    else
      render json: ['Invalid credentials']
    end
  end

  def destroy
    @user = current_user
    if @user
      log_out
    else
      render json: ['No one logged in']
    end
  end
end
