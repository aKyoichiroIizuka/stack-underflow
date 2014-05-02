require 'test_helper'

class AnswerVoteTest < ActiveSupport::TestCase
	test "find" do
		assert_equal 1, AnswerVote.count, "count"
		
		av = AnswerVote.find(1)
		assert_equal av.id, 1, "find id"
		assert_equal av.value, 1, "find value"
		assert_equal av.user_id, 1, "find user_id"
		assert_equal av.answer_id, 1, "find answer_id"
	end
	
	test "true save" do
		av = AnswerVote.new({:value => 1, :user_id => 1, :answer_id => 1})
		assert av.save, "save av"
	end
	
	test "not equal type save" do
		av = AnswerVote.new({:value => nil, :user_id => 1, :answer_id => 1})
		assert_equal av.save, false, "value is nil"
		av = AnswerVote.new({:value => 0.0, :user_id => 1, :answer_id => 1})
		assert_equal av.save, false, "value is 0.0"
		av = AnswerVote.new({:value => "v", :user_id => 1, :answer_id => 1})
		assert_equal av.save, false, 'value is "v"'
				
		av = AnswerVote.new({:value => 1, :user_id => nil, :answer_id => 1})
		assert_equal av.save, false, "user_id is nil"
		av = AnswerVote.new({:value => 1, :user_id => 0.0, :answer_id => 1})
		assert_equal av.save, false, "user_id is 0.0"
		av = AnswerVote.new({:value => 1, :user_id => "u", :answer_id => 1})
		assert_equal av.save, false, 'user_id is "u"'
		
		av = AnswerVote.new({:value => "answer1", :user_id => 1, :answer_id => nil})
		assert_equal av.save, false, "answer_id is nil"
		av = AnswerVote.new({:value => "answer1", :user_id => 1, :answer_id => 0.0})
		assert_equal av.save, false, "answer_id is 0.0"
		av = AnswerVote.new({:value => "answer1", :user_id => 1, :answer_id => "a"})
		assert_equal av.save, false, 'answer_id is "a"'
	end
	
	test "false save" do
		av = AnswerVote.new({:value => -2, :user_id => 1, :answer_id => 1})
		assert_equal av.save, false, "value is -2"
		av = AnswerVote.new({:value => 2, :user_id => 1, :answer_id => 1})
		assert_equal av.save, false, "value is 2"
		
		av = AnswerVote.new({:value => 1, :user_id => 0, :answer_id =>1})
		assert_equal av.save, false, "user_id is 0"
		av = AnswerVote.new({:value => 1, :user_id => -1, :answer_id =>1})
		assert_equal av.save, false, "user_id is -1"
		
		av = AnswerVote.new({:value => 1, :user_id => 1, :answer_id =>0})
		assert_equal av.save, false, "question_id is 0"
		av = AnswerVote.new({:value => 1, :user_id => 1, :answer_id =>-1})
		assert_equal av.save, false, "question_id is -1"
	end
end
