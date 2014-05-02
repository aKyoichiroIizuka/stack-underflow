class Question < ActiveRecord::Base
  has_many :question_votes
  has_many :question_comments

  has_many :answers
  
  belongs_to :user

  validates :title, :presence => true, :length => {:minimum => 1, :maximum => 255}
  validates :user_id, :numericality => {:only_integer => true, :greater_than => 0}
  validates :content, :presence => true, :length => {:minimum => 1}

  def total_points
    q=self.question_votes
      .sum(:value)
    return q
  end
end
