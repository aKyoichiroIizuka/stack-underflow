class QuestionVote < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  
  validates :value, :numericality => {:only_integer => true, :greater_than => -2, :less_than => 2}
  validates :question_id, :numericality => {:only_integer => true, :greater_than => 0}
  validates :user_id, :numericality => {:only_integer => true, :greater_than => 0}

end
