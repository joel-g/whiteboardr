module InterviewHelper
  def self.todays_interviews
    Interview.where(created_at: Date.today.beginning_of_day..Date.today.end_of_day)
  end
end
