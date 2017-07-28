class InterviewsController < ApplicationController

  def index
    @interviews = Interview.all.order(created_at: 'DESC')
  end

  def new
    @interview = Interview.new
    populate_challenges
  end

  def create
    @interview = Interview.new
    entered_applicant_name = params[:interview][:applicant_id]
    applicant = User.find_by(username: params[:interview][:applicant_id])
    if applicant
      params[:interview][:applicant_id] = applicant.id
      @interview = Interview.new(interview_params)
      if @interview.save
        redirect_to interview_path(@interview.id)
      else
        populate_challenges
        @interview.errors.add(:interview, 'was not started.')
        @interview.applicant_id = entered_applicant_name
        render :new
      end
    else
      populate_challenges
      @interview.errors.add(:applicant, 'username not found.')
      render :new
    end
  end

  def show
   @interview = Interview.find(params[:id])
  end

  private

  def populate_challenges
    @challenges = Challenge.all.order(difficulty: 'ASC', title: 'ASC')
  end

  def interview_params
    params.require(:interview).permit(:interviewer_id, :applicant_id, :challenge_id)
  end

end
