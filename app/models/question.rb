class Question < ActiveRecord::Base
  has_many :question_votes
  has_many :question_comments
end
