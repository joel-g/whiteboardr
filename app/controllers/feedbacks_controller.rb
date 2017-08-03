class FeedbacksController < ApplicationController

  def create
    @interview = Interview.find(params[:interview_id])
    @feedback = @interview.feedbacks.new(feedback_params)
    if @feedback.save
      redirect_to i_path(token: @interview.token)
    else
      render "interviews/show"
    end
  end

  def edit
    @interview = Interview.find(params[:interview_id])
    @feedback = Feedback.find(params[:id])
  end

  def update
    @interview = Interview.find(params[:interview_id])
    @feedback = Feedback.find(params[:id])
    if current_user.id == @feedback.user_id
      @feedback.assign_attributes(feedback_params)
      if @feedback.save
        redirect_to i_path(token: @interview.token)
      else
        render :edit
      end
    else
      redirect_to root_path
    end
  end

private

  def feedback_params
    params.require(:feedback).permit(:user_id, :interview_id, :board_rating, :presence_rating, :knowledge_rating, :riot_rating, :comments)
  end

end
