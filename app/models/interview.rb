class Interview < ActiveRecord::Base
  belongs_to :interviewer, class_name: 'User', foreign_key: 'interviewer_id'
  belongs_to :applicant, class_name: 'User', foreign_key: 'applicant_id'
  belongs_to :challenge
  has_many :feedbacks

end
