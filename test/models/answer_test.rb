require 'test_helper'

class AnswerTest < ActiveSupport::TestCase	
	test "find" do
		assert_equal 1, Answer.count, "count"
		
		ans=Answer.find(1)
		assert_equal ans.id, 1, "find id"
		assert_equal ans.content, "answer1", "find content"
		assert_equal ans.user_id, 1, "find user_id"
		assert_equal ans.question_id, 1, "find question_id"
	end
	
	test "true save" do
		ans = Answer.new({:content => "answer1", :user_id => 1, :question_id => 1})		
		assert ans.save, "save answer"

		ans = Answer.new({:content => 0, :user_id => 1, :question_id => 1})		
		assert_equal ans.save, true, "content is 0"
		newans = Answer.find(ans.id)
		assert_equal newans.content, '0',"content is '0"
		
		ans = Answer.new({:content => 0.1, :user_id => 1, :question_id => 1})
		assert_equal ans.save, true, "content is 0.1"
		newans = Answer.find(ans.id)
		assert_equal newans.content, '0.1', "content is '0.1'"
	end

	test "not equal type save" do
		ans = Answer.new({:content => nil, :user_id => 1, :question_id => 1})
		assert_equal ans.save, false, "content is nil"
				
		ans = Answer.new({:content => "answer1", :user_id => nil, :question_id => 1})
		assert_equal ans.save, false, "user_id is nil"
		ans = Answer.new({:content => "answer1", :user_id => 0.0, :question_id => 1})
		assert_equal ans.save, false, "user_id is 0.0"
		ans = Answer.new({:content => "answer1", :user_id => "u", :question_id => 1})
		assert_equal ans.save, false, 'user_id is "u"'
		
		ans = Answer.new({:content => "answer1", :user_id => 1, :question_id => nil})
		assert_equal ans.save, false, "question_id is nil"
		ans = Answer.new({:content => "answer1", :user_id => 1, :question_id => 0.0})
		assert_equal ans.save, false, "question_id is 0.0"
		ans = Answer.new({:content => "answer1", :user_id => 1, :question_id => "q"})
		assert_equal ans.save, false, 'question_id is "q"'
	end

	test "false save" do
		ans = Answer.new({:content => "", :user_id => 1, :question_id => 1})		
		assert_equal ans.save, false, 'content is ""'
		
		ans = Answer.new({:content => "answer1", :user_id => 0, :question_id =>1})
		assert_equal ans.save, false, "user_id is 0"
		ans = Answer.new({:content => "answer1", :user_id => -1, :question_id =>1})
		assert_equal ans.save, false, "user_id is -1"
		
		ans = Answer.new({:content => "answer1", :user_id => 1, :question_id =>0})
		assert_equal ans.save, false, "question_id is 0"
		ans = Answer.new({:content => "answer1", :user_id => 1, :question_id =>-1})
		assert_equal ans.save, false, "question_id is -1"
	end
end
