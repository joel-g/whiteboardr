class ChallengesController < ApplicationController
  include ApplicationHelper

  skip_before_action :require_login, only: [:index]

  def index
    @difficulty_checked = { 'Easy' => false,
                            'Medium' => false,
                            'Hard' => false
                          }
    where_query = 'true '
    where_params = []
    if (params[:difficulty])
      where_query << ' AND difficulty in (?) '
      where_params = params[:difficulty]
      where_params.each do |difficulty|
        @difficulty_checked[difficulty] = true
      end
    end
    @challenges = Challenge.where(where_query, where_params)
    render :index
  end

  def new
    @tag = Tag.new
    @challenge = Challenge.new
    render :new
  end

  def create
    tag_string = params[:challenge][:tag][:name]
    isolate_tags(tag_string).each {|tag| Tag.create(name: tag)}
    @challenge = Challenge.new(challenge_params)
    if @challenge.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def challenge_params
    params.require(:challenge).permit(:user_id, :title, :body, :difficulty, :notes, :solution)
  end

end
