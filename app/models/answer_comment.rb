class AnswerComment < ActiveRecord::Base
  belongs_to :answer
  
  belongs_to :user
  
  validates :content, :presence => true, :length => {:minimum => 1}
  validates :user_id, :numericality => {:only_integer => true, :greater_than => 0}
  validates :answer_id, :numericality => {:only_integer => true, :greater_than => 0}
end
