class QuestionComment < ActiveRecord::Base
  after_save :update_timestamps_of_question

  belongs_to :question
  belongs_to :user
  
  validates :question_id, :numericality => {:only_integer => true, :greater_than => 0}
  validates :user_id, :numericality => {:only_integer => true, :greater_than => 0}
  validates :content, :presence => true, :length => {:minimum => 1, :maximum => 255}

  private
    def update_timestamps_of_question
      self.question.touch
    end
end
