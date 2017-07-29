class Feedback < ActiveRecord::Base
  belongs_to :user
  belongs_to :interview

  validates_presence_of :user_id, :interview_id, :board_rating, :presence_rating, :knowledge_rating, :riot_rating, :comments
end
