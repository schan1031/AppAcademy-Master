class GoalsController < ApplicationController

  before_action :require_logged_in

  def index
    render :index
  end

  def show
    @goal = Goal.find(params[:id])
    render :show
  end

  def new
    render :new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    if @goal.save
      redirect_to goals_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:body, :user_id)
  end
end
