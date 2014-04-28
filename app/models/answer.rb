class Answer < ActiveRecord::Base
  has_many :answer_votes
  has_many :answer_comments
  
  def total_points
    ans=self.answer_votes
    	.sum(:value)
    return ans
  end
end
