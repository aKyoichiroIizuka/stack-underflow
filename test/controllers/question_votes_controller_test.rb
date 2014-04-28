require 'test_helper'

class QuestionVotesControllerTest < ActionController::TestCase
  setup do
    @question_vote = question_votes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:question_votes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create question_vote" do
    assert_difference('QuestionVote.count') do
      post :create, question_vote: { question_id: @question_vote.question_id, user_id: @question_vote.user_id, value: @question_vote.value }
    end

    assert_redirected_to question_vote_path(assigns(:question_vote))
  end

  test "should show question_vote" do
    get :show, id: @question_vote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @question_vote
    assert_response :success
  end

  test "should update question_vote" do
    patch :update, id: @question_vote, question_vote: { question_id: @question_vote.question_id, user_id: @question_vote.user_id, value: @question_vote.value }
    assert_redirected_to question_vote_path(assigns(:question_vote))
  end

  test "should destroy question_vote" do
    assert_difference('QuestionVote.count', -1) do
      delete :destroy, id: @question_vote
    end

    assert_redirected_to question_votes_path
  end
end
