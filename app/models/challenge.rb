class Challenge < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :body, presence: true, uniqueness: true
  validates :difficulty, presence: true
  belongs_to :user
  has_many :tags, through: :challenge_tags
  has_many :challenge_tags

  def title_and_difficulty
    "#{self.title} - #{self.difficulty}"
  end

end
