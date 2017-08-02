class ChallengesController < ApplicationController
  include ApplicationHelper

  skip_before_action :require_login, only: [:index, :show]

  def index
    # Filter by difficulty
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

    # Filter by tag
    @tags_checked = {}
    tagged_challenges = []
    Tag.all.each do |tag|
      @tags_checked[tag] = false
    end

    where_tag_params = []
    where_tag_query = 'true '
    if (params[:tag])
      p params[:tag]
      where_tag_query << ' AND tags.name in (?)'
      where_tag_params = params[:tag]
      where_tag_params.each do |tag|
        @tags_checked[tag] = true
      end
    end
    @challenges = @challenges.left_outer_joins(:tags).where(where_tag_query, where_tag_params).distinct

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
