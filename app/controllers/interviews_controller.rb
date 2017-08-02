class InterviewsController < ApplicationController
  skip_before_action :require_login, only: [:index]

  def index
    if logged_in?
      @applicant_interviews = Interview.where(applicant_id: current_user.id).order(created_at: 'DESC').limit(5)
      @interviewer_interviews = InterviewHelper.todays_interviews.where(interviewer_id: current_user.id)
    end
    render :index
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
    if current_user == @interview.applicant || current_user == @interview.interviewer
      render :show
    else
      redirect_to root_path
    end
  end

  def update
    @interview = Interview.find(params[:id])
    @feedback = Feedback.new
    @interview.update(image_params)
    render :show
  end

  def find
    matching_interviews = TokenHelper.get_matches(InterviewHelper.todays_interviews, params[:token])
    if matching_interviews.count == 1
      @interview = matching_interviews.first
      @feedback = Feedback.new
      render :show
    else
      flash[:alert] = "Could not find that interview"
      redirect_to root_path
    end
  end

  private

  def interview_params
    params.require(:interview).permit(:interviewer_id, :applicant_id, :challenge_id)
  end

  def image_params
    params.require(:interview).permit(:image)
  end

end
