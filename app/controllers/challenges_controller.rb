class ChallengesController < ApplicationController

  def new
    @tag = Tag.new
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
