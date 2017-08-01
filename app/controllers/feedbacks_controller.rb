class FeedbacksController < ApplicationController

  def create
    @interview = Interview.find(params[:interview_id])
    @feedback = @interview.feedbacks.new(feedback_params)
    if @feedback.save
      redirect_to @interview
    else
      render "interviews/show"
    end
  end

  def edit
    puts 'in edit for feedback controller ***********'
    @feedback = Feedback.find(params[:id])
  end

private

  def feedback_params
    params.require(:feedback).permit(:user_id, :interview_id, :board_rating, :presence_rating, :knowledge_rating, :riot_rating, :comments)
  end

end
