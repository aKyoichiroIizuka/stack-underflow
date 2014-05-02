require 'test_helper'

class QuestionVoteTest < ActiveSupport::TestCase
  test "is validate" do
    q = QuestionVote.new({:value => 0, :question_id => 1, :user_id => nil})
    assert_equal q.save, false, "user_id is nil"
    q = QuestionVote.new({:value => 0, :question_id => 1, :user_id => 0})
    assert_equal q.save, false, "user_id is zero"
    q = QuestionVote.new({:value => 0, :question_id => 1, :user_id => -1})
    assert_equal q.save, false, "user_id is minus"
    q = QuestionVote.new({:value => 0, :question_id => 1, :user_id => "Q"})
    assert_equal q.save, false, "user_id is string"
    q = QuestionVote.new({:value => 0, :question_id => 1, :user_id => 0.1})
    assert_equal q.save, false, "user_id is not integer"
    
    q = QuestionVote.new({:value => 0, :question_id => nil, :user_id => 1})
    assert_equal q.save, false, "question_id is nil"
    q = QuestionVote.new({:value => 0, :question_id => 0, :user_id => 1})
    assert_equal q.save, false, "question_id is zero"
    q = QuestionVote.new({:value => 0, :question_id => -1, :user_id => 1})
    assert_equal q.save, false, "question_id is minus"
    q = QuestionVote.new({:value => 0, :question_id => "A", :user_id => 1})
    assert_equal q.save, false, "question_id is string"
    q = QuestionVote.new({:value => 0, :question_id => 0.1, :user_id => 1})
    assert_equal q.save, false, "question_id is not integer"

    q = QuestionVote.new({:value => nil, :question_id => 0, :user_id => 1})
    assert_equal q.save, false, "question_id is nil"
    q = QuestionVote.new({:value => 2, :question_id => 1, :user_id => 1})
    assert_equal q.save, false, "value is great than 1"
    q = QuestionVote.new({:value => -2, :question_id => 1, :user_id => 1})
    assert_equal q.save, false, "value is less than -1"
    q = QuestionVote.new({:value => "F", :question_id => 1, :user_id => 1})
    assert_equal q.save, false, "user_id is string"
    q = QuestionVote.new({:value => 0.1, :question_id => 1, :user_id => 1})
    assert_equal q.save, false, "user_id is not integer"

  end

end
