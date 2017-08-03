class Challenge < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :body, presence: true, uniqueness: true
  validates :difficulty, presence: true
  belongs_to :user
  has_many :tags, through: :challenge_tags
  has_many :challenge_tags
  accepts_nested_attributes_for :tags

  def title_and_difficulty
    "#{self.title} - #{self.difficulty}"
  end


  # Takes the name of a tag and searches for challenges with that tag
  def self.tagged_with(name)
    Tag.find_by(name: name).challenges
  end

end
