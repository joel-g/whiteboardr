class ChallengesController < ApplicationController

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)
  end

  private

  def challenge_params
    params.require(:challenge).permit(:title, :body, :difficulty, :input, :output, :solution)
  end

end
