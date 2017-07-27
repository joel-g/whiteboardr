class User < ApplicationRecord
  authenticates_with_sorcery!

  validates_presence_of :email, :username
  validates_uniqueness_of :email, :username

  has_many :interviews, class_name: 'Interview', foreign_key: 'applicant_id'
  has_many :feedbacks, through: :interviews
end
