class Tag < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates_format_of :name, :with => /^[a-z]+$/i
  has_many :challenges, through: :challenge_tags
end
