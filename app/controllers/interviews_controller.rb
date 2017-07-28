class InterviewsController < ApplicationController

  def index
    @interviews = Interview.all.order(created_at: 'DESC')
  end

  def new
    @interview = Interview.new
    @challenges = Challenge.all.order(difficulty: 'ASC', title: 'ASC')
  end

  def create

  end


  def show
   @interview = Interview.find(params[:id])
  end

end
