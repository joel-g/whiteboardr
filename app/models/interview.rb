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

  belongs_to :interviewer, class_name: 'User', foreign_key: 'interviewer_id'
  belongs_to :applicant, class_name: 'User', foreign_key: 'applicant_id'
  belongs_to :challenge
  has_many :feedbacks

  validates_presence_of :interviewer_id, :applicant_id, :challenge_id

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
