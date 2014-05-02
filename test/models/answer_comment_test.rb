require 'test_helper'

class AnswerCommentTest < ActiveSupport::TestCase
	test "find" do
		assert_equal 1, AnswerComment.count, "count"
		
		ac=AnswerComment.find(1)
		assert_equal ac.id, 1, "find id"
		assert_equal ac.content, "answercomment1", "find content"
		assert_equal ac.user_id, 1, "find user_id"
		assert_equal ac.answer_id, 1, "find answer_id"
	end
	
	test "true save" do
		ac = AnswerComment.new({:content => "answercomment1", :user_id => 1, :answer_id => 1})		
		assert ac.save, "save answercomment"

		ac = AnswerComment.new({:content => 0, :user_id => 1, :answer_id => 1})		
		assert_equal ac.save, true, "content is 0"
		newac = AnswerComment.find(ac.id)
		assert_equal newac.content, '0', "content is '0'"
		
		ac = AnswerComment.new({:content => 0.0, :user_id => 1, :answer_id => 1})		
		assert_equal ac.save, true, "content is 0.0"
		newac = AnswerComment.find(ac.id)
		assert_equal newac.content, '0.0', "content is '0.0'"
	end

	test "not equal type save" do
		ac = AnswerComment.new({:content => nil, :user_id => 1, :answer_id => 1})
		assert_equal ac.save, false, "content is nil"
				
		ac = AnswerComment.new({:content => "answercomment1", :user_id => nil, :answer_id => 1})
		assert_equal ac.save, false, "user_id is nil"
		ac = AnswerComment.new({:content => "answercomment1", :user_id => 0.0, :answer_id => 1})
		assert_equal ac.save, false, "user_id is 0.0"
		ac = AnswerComment.new({:content => "answercomment1", :user_id => "u", :answer_id => 1})
		assert_equal ac.save, false, 'user_id is "u"'
		
		ac = AnswerComment.new({:content => "answercomment1", :user_id => 1, :answer_id => nil})
		assert_equal ac.save, false, "question_id is nil"
		ac = AnswerComment.new({:content => "answercomment1", :user_id => 1, :answer_id => 0.0})
		assert_equal ac.save, false, "question_id is 0.0"
		ac = AnswerComment.new({:content => "answercomment1", :user_id => 1, :answer_id => "a"})
		assert_equal ac.save, false, 'question_id is "a"'
	end

	test "false save" do
		ac = AnswerComment.new({:content => "", :user_id => 1, :answer_id => 1})		
		assert_equal ac.save, false, 'content is ""'
		
		ac = AnswerComment.new({:content => "answercomment1", :user_id => 0, :answer_id =>1})
		assert_equal ac.save, false, "user_id is 0"
		ac = AnswerComment.new({:content => "answercomment1", :user_id => -1, :answer_id =>1})
		assert_equal ac.save, false, "user_id is -1"
		
		ac = AnswerComment.new({:content => "answercomment1", :user_id => 1, :answer_id =>0})
		assert_equal ac.save, false, "question_id is 0"
		ac = AnswerComment.new({:content => "answercomment1", :user_id => 1, :answer_id =>-1})
		assert_equal ac.save, false, "question_id is -1"
	end
end