class InterviewsController < ApplicationController

  def index
    @interviews = Interview.all.order(created_at: 'DESC')
  end

  def new
    @interview = Interview.new
  end

  def create

  end


  def show
   @interview = Interview.find(params[:id])
  end

end
