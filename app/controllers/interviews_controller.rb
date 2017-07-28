class InterviewsController < ApplicationController

  def index
    @interviews = Interview.all.order(created_at: 'DESC')
  end

  def new
    @interview = Interview.new
    @challenges = Challenge.all.order(difficulty: 'ASC', title: 'ASC')
  end

  def create
    @interview = Interview.new
    applicant = User.find_by(username: params[:interview][:applicant_id])
    if applicant
      params[:interview][:applicant_id] = applicant.id
      @interview = Interview.new(interview_params)
      if @interview.save
        redirect_to interview_path(@interview.id)
      else
        @challenges = Challenge.all.order(difficulty: 'ASC', title: 'ASC')
        @interview.errors.add(:interview, 'was not started.')
        render :new
      end
    else
      @challenges = Challenge.all.order(difficulty: 'ASC', title: 'ASC')
      @interview.errors.add(:applicant, 'username not found.')
      render :new
    end

  end


  def show
   @interview = Interview.find(params[:id])
  end

  private

  def interview_params
    params.require(:interview).permit(:interviewer_id, :applicant_id, :challenge_id)
  end

end
