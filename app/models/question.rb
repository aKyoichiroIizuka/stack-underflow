class Question < ActiveRecord::Base
  has_many :question_votes
  has_many :question_comments

  has_many :answers
  
  belongs_to :user

  validates :title, :presence => true

  def total_points
    q=self.question_votes
      .sum(:value)
    return q
  end
end
