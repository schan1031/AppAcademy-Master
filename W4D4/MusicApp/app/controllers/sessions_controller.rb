class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password],
    )

    if user.nil?
      flash[:errors] = ["Invalid email or password"]
      render :new
    else
      login_user!(user)
      redirect_to :show
    end
  end

  def destroy
    current_user.reset_session_token! unless current_user.nil?
    session[:session_token] = nil
  end

end
