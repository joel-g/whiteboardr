class InterviewsController < ApplicationController
  skip_before_action :require_login, only: [:index]

  def index
    @interviews = Interview.all.order(created_at: 'DESC')
  end

  def new
    @interview = Interview.new
    @challenge = Challenge.find(params[:challenge_id])
  end

  def create
    @challenge = Challenge.find(params[:interview][:challenge_id])
    @interview = Interview.new
    entered_applicant_name = params[:interview][:applicant_id]
    applicant = User.find_by(username: params[:interview][:applicant_id])
    if applicant
      params[:interview][:applicant_id] = applicant.id
      @interview = Interview.new(interview_params)
      if @interview.save
        redirect_to interview_path(@interview.id)
      else
        @interview.errors.add(:interview, 'was not started.')
        @interview.applicant_id = entered_applicant_name
        render :new
      end
    else
      @interview.errors.add(:applicant, 'username not found.')
      render :new
    end
  end

  def show
    @interview = Interview.find(params[:id])
    @feedback = Feedback.new
  end

  private

  def interview_params
    params.require(:interview).permit(:interviewer_id, :applicant_id, :challenge_id)
  end

end
