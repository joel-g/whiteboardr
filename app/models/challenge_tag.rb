class ChallengeTag < ApplicationRecord
  validates_uniqueness_of :tag_id, :scope => [:challenge_id]
  validates :challenge_id, presence: true
  validates :tag_id, presence: true
  belongs_to :tag
  belongs_to :challenge
end
