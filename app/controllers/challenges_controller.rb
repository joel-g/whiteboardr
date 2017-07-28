class ChallengesController < ApplicationController

  def new
    if logged_in?
      @challenge = Challenge.new
      render :new
    else
      redirect_to '/sessions/new'
    end
  end

  def create
    @challenge = Challenge.new(challenge_params)
    if @challenge.save
      render 'interviews/index'
    else
      render :new
    end
  end

  private

  def challenge_params
    params.require(:challenge).permit(:title, :body, :difficulty, :input, :output, :solution)
  end

end
