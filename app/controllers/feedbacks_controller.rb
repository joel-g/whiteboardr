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
    @interview = Interview.find(params[:interview_id])
    @feedback = Feedback.find(params[:id])
  end

  def update
    if true
      #later, put test here to see if user logged in
      @interview = Interview.find(params[:interview_id])
      @feedback = Feedback.find(params[:id])
      puts 'in update for feedback controller, about to save. @feedback to follow'
      p @feedback
      puts 'in update for feedback controller, about to save. @interview to follow'
      p @interview
      @feedback.assign_attributes(feedback_params)
      puts 'after assign_attributes, interview to follow'
      p @interview
      if @feedback.save
        redirect_to interview_path(params[:interview_id])
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
