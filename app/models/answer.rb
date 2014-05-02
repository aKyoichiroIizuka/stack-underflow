class Answer < ActiveRecord::Base
  has_many :answer_votes
  has_many :answer_comments
  belongs_to :question
  
  belongs_to :user
  
  validates :content, :presence => true, :length => {:minimum => 1}
  validates :user_id, :numericality => {:only_integer => true, :greater_than => 0}
  validates :question_id, :numericality => {:only_integer => true, :greater_than => 0}

  def total_points
    ans=self.answer_votes
    	.sum(:value)
    return ans
  end
end
