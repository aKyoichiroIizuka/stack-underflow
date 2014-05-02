class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :questions
  has_many :question_votes
  has_many :question_comments
  has_many :answers
  has_many :answer_votes
  has_many :answer_comments

  validates :name, :presence => true, :uniqueness => true

  def total_points
    self.questions.inject(0){|x, y| x + y.total_points}
  end
end
