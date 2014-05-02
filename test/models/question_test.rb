require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  test "find" do
    assert_equal 1, Question.count, "count"
    
    q = Question.find(1)
    assert_equal q.id, 1, "find_id"
    assert_equal q.title, "Q", "find title"
    assert_equal q.user_id, 1, "find user_id"
    assert_equal q.content, "Question1", "find content"
  end
  
  test "true save" do
    q = Question.new({:title => "Q", :content => "Question1", :user_id => 1})
    
    assert q.save, "save question"
  end
  
  test "not equal type save" do
    q = Question.new({:title => nil, :content => "Question1", :user_id=> 1})
    assert_equal q.save, false, "title is nil"
    q = Question.new({:title => "qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq", :content => "Question", :user_id=> 1})
    assert_equal q.save, false, "title is too long"
    
    q = Question.new({:title => "Q", :content => nil, :user_id=> 1})
    assert_equal q.save, false, "content is nil"
    
    q = Question.new({:title => "Q", :content => "Question", :user_id => 0})
    assert_equal q.save, false, "user_id is zero"
    q = Question.new({:title => "Q", :content => "Question", :user_id => -1})
    assert_equal q.save, false, "user_id is minus"
    q = Question.new({:title => "Q", :content => "Question", :user_id => "Q"})
    assert_equal q.save, false, "user_id is string"
    q = Question.new({:title => "Q", :content => "Question", :user_id => 0.1})
    assert_equal q.save, false, "user_id is not integer"
  end

end