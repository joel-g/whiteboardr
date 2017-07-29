class User < ApplicationRecord
  authenticates_with_sorcery!

  validates_presence_of :email, :username, :first_name, :last_name, :password
  validates_uniqueness_of :email, :username

  has_many :interviews, class_name: 'Interview', foreign_key: 'applicant_id'
  has_many :feedbacks, through: :interviews

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
