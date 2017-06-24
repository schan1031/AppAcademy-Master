class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    uinfo = params[:user]
    @user = User.find_by_credentials(
      uinfo[:username],
      uinfo[:password]
    )
    if @user
      log_in(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ['Invalid credentials']
      render :new
    end
  end

  def destroy
    log_out
    redirect_to users_url
  end
end
