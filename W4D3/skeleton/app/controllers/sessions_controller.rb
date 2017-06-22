class SessionsController < ApplicationController
  before_action :require_logged_out, only: [:new, :create]
  before_action :require_logged_in, only: [:destroy]

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
    if user.nil?
      flash.now[:errors] = ["Invalid username or password"]
      redirect_to new_session_url
    else
      login_user!(user)
      redirect_to cats_url
    end
  end

  def destroy
    session[:session_token] = nil
    current_user.reset_session_token! unless current_user.nil?
    redirect_to new_session_url
  end


end
