require 'digest'

module TokenHelper
  def self.create_token(interviewer_id, candidate_id, challenge_id, created_at)
    token = []
    digest = Digest::MD5.new
    token << digest.hexdigest(interviewer_id.to_s + created_at.strftime('%m%d%Y%H%M%S')).to_i(16) % 26
    token << digest.hexdigest(candidate_id.to_s + created_at.strftime('%m%d%Y%H%M%S')).to_i(16) % 26
    token << digest.hexdigest(challenge_id.to_s + created_at.strftime('%m%d%Y%H%M%S')).to_i(16) % 26
    token << digest.hexdigest(created_at.strftime('%m%d%Y%H%M%S')).to_i(16) % 26
    token.map { |i| (65 + i).chr }.join()
  end

  def self.todays_interviews
    Interview.where(created_at: Date.today.beginning_of_day..Date.today.end_of_day)
  end

  def self.get_matches(interviews, possible_token)
    interviews.where(token: possible_token)
  end
end
