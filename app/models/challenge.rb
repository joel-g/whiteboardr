class Challenge < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :body, presence: true
  validates :difficulty, presence: true
  belongs_to :user

  def title_and_difficulty
    "#{self.title} - #{self.difficulty}"
  end


end
