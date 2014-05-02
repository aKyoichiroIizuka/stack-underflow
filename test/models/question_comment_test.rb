require 'test_helper'

class QuestionCommentTest < ActiveSupport::TestCase
  test "is true data" do
    q = QuestionComment.new({:question_id => 1, :user_id => nil, :content =>"a"})
    assert_equal q.save, false, "user_id is nil"
    q = QuestionComment.new({:question_id => 1, :user_id => 0, :content =>"a"})
    assert_equal q.save, false, "user_id is zero"
    q = QuestionComment.new({:question_id => 1, :user_id => -1, :content =>"a"})
    assert_equal q.save, false, "user_id is minus"
    q = QuestionComment.new({:question_id => 1, :user_id => "Q", :content =>"a"})
    assert_equal q.save, false, "user_id is string"
    q = QuestionComment.new({:question_id => 1, :user_id => 0.1, :content =>"a"})
    assert_equal q.save, false, "user_id is not integer"
    
    q = QuestionComment.new({:question_id => nil, :user_id => 1, :content =>"a"})
    assert_equal q.save, false, "question_id is nil"
    q = QuestionComment.new({:question_id => 0, :user_id => 1, :content =>"a"})
    assert_equal q.save, false, "question_id is zero"
    q = QuestionComment.new({:question_id => -1, :user_id => 1, :content =>"a"})
    assert_equal q.save, false, "question_id is minus"
    q = QuestionComment.new({:question_id => "A", :user_id => 1, :content =>"a"})
    assert_equal q.save, false, "question_id is string"
    q = QuestionComment.new({:question_id => 0.1, :user_id => 1, :content =>"a"})
    assert_equal q.save, false, "question_id is not integer"
    
    q = QuestionComment.new({:question_id => 1, :user_id => 1, :content => nil})
    assert_equal q.save, false, "content is nil"
    q = QuestionComment.new({:question_id => 1, :user_id => 1, :content => ""})
    assert_equal q.save, false, "content is nothing"
    q = QuestionComment.new({:question_id => 1, :user_id => 1, :content => "qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq"})
    assert_equal q.save, false, "content is too long"

  end
end
