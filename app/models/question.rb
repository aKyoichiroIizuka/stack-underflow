class Question < ActiveRecord::Base
  has_many :question_votes
  has_many :question_comments

  has_many :answers
end
