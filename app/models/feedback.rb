class Feedback < ActiveRecord::Base
belongs_to :user
belongs_to :interview
belongs_to :applicant #, through: :interviews #, class_name: 'User', foreign_key: 'applicant_id'
end
