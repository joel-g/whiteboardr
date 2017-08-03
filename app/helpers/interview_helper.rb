module InterviewHelper
  def self.todays_interviews
    Interview.where(created_at: Time.now.beginning_of_day..Time.now.end_of_day)
  end
end
