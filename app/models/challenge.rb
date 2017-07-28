class Challenge < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  validates :difficulty, presence: true
  belongs_to :user
end
