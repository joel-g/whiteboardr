class Interview < ActiveRecord::Base
  belongs_to :interviewer, class_name: 'User', foreign_key: 'interviewer_id'
  belongs_to :applicant, class_name: 'User', foreign_key: 'applicant_id'
  belongs_to :challenge
  has_many :feedbacks

  validates_presence_of :interviewer_id, :applicant_id, :challenge_id

  def gave_feedback?(user)
    self.feedbacks.where(user_id: user.id).count > 0
  end

end
