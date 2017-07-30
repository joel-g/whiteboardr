class ChallengesController < ApplicationController
  skip_before_action :require_login, only: [:index]

  def index
    where_query = 'true '
    where_params = []
    if (params[:difficulty])
      where_query << ' AND difficulty in (?) '
      where_params = params[:difficulty]
    end
    @challenges = Challenge.where(where_query, where_params)
    render :index
  end

  def new
    @challenge = Challenge.new
    render :new
  end

  def create
    @challenge = Challenge.new(challenge_params)
    if @challenge.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def challenge_params
    params.require(:challenge).permit(:user_id,:title, :body, :difficulty, :input, :output, :solution)
  end

end
