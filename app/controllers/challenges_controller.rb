class ChallengesController < ApplicationController
  include ApplicationHelper

  skip_before_action :require_login, only: [:index, :show]

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
    if (params[:tags])
      where_params = 
      where_params.each do |tag|
        @tags_checked[tag] = true
      end
    end
    @challenges = Challenge.where(where_query, where_params)
    render :index
  end

  def show
    @challenge = Challenge.find(params[:id])
    render :show
  end

  def new
    @tag = Tag.new
    @challenge = Challenge.new
    render :new
  end

  def create
    @tag = Tag.new
    @challenge = Challenge.new(challenge_params)
    if @challenge.save
      if params[:challenge][:tag]
        tag_string = params[:challenge][:tag][:name]
        isolate_tags(tag_string).each do |tag|
          tag_id = Tag.find_or_create_by(name: tag).id
          ChallengeTag.create(challenge_id: @challenge.id, tag_id: tag_id)
        end
      end
      redirect_to challenge_path(@challenge.id)
    else
      render :new
    end
  end

  private

  def challenge_params
    params.require(:challenge).permit(:user_id, :title, :body, :difficulty, :notes)
  end

end
