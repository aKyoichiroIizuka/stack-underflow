class AnswerVote < ActiveRecord::Base
  belongs_to :answer
  
  belongs_to :user
  
  validates :value, :numericality => {:only_integer => true, :greater_than => -2, :less_than => 2}
  validates :user_id, :numericality => {:only_integer => true, :greater_than => 0}
  validates :answer_id, :numericality => {:only_integer => true, :greater_than => 0}
end
