class Challenge < ActiveRecord::Base
  validates :title, presence: true
  validates :input, presence: true
  validates :output, presence: true
  validates :body, presence: true
  belongs_to :user
end
