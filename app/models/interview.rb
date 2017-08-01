class Interview < ActiveRecord::Base
  dragonfly_accessor :image do
    after_assign :resize_image
  end

  def resize_image
    if image.image?
      image.process!(:thumb, '800x600>')
    end
  end

  validates_property :format, of: :image, in: ['jpeg', 'png', 'gif']

  validate :cannot_interview_self

  belongs_to :interviewer, class_name: 'User', foreign_key: 'interviewer_id'
  belongs_to :applicant, class_name: 'User', foreign_key: 'applicant_id'
  belongs_to :challenge
  has_many :feedbacks

  validates_presence_of :interviewer_id, :applicant_id, :challenge_id

  after_create :generate_unique_token_per_day

  def generate_unique_token_per_day
    possible_token = TokenHelper.create_token(self.interviewer_id, self.applicant_id, self.challenge_id, self.created_at)
    todays_interviews = TokenHelper.todays_interviews
    matching_interviews = TokenHelper.get_matches(todays_interviews, possible_token)
    fail_count = 0
    while matching_interviews.count > 0 && fail_count < 10
      possible_token = TokenHelper.create_token(self.interviewer_id, self.applicant_id, self.challenge_id, Time.now + fail_count)
      matching_interviews = TokenHelper.get_matches(todays_interviews, possible_token)
      fail_count += 1
    end
    self.token = possible_token
    self.save
  end

  def cannot_interview_self
    if self.interviewer_id == self.applicant_id
      self.errors.add(:interviewer, 'cannot be the applicant')
    end
  end

  def has_feedback_from?(user)
    self.feedbacks.where(user_id: user.id).count > 0
  end

  def average_knowledge_rating
    if self.feedbacks.length > 0
      total = self.feedbacks.reduce(0) { |sum, feedback| sum + feedback.knowledge_rating }
      total.to_f / self.feedbacks.length.to_f
    else
      nil
    end
  end

  def average_presence_rating
    if self.feedbacks.length > 0
      total = self.feedbacks.reduce(0) { |sum, feedback| sum + feedback.presence_rating }
      total.to_f / self.feedbacks.length.to_f
    else
      nil
    end
  end

  def average_riot_rating
    if self.feedbacks.length > 0
      total = self.feedbacks.reduce(0) { |sum, feedback| sum + feedback.riot_rating }
      total.to_f / self.feedbacks.length.to_f
    else
      nil
    end
  end

  def average_board_rating
    if self.feedbacks.length > 0
      total = self.feedbacks.reduce(0) { |sum, feedback| sum + feedback.board_rating }
      total.to_f / self.feedbacks.length.to_f
    else
      nil
    end
  end

  def date
    self.created_at.getlocal.strftime('%-m/%-d/%Y')
  end

end
