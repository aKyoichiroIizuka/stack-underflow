require 'test_helper'

class AnswerVotesControllerTest < ActionController::TestCase
  setup do
    @answer_vote = answer_votes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:answer_votes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create answer_vote" do
    assert_difference('AnswerVote.count') do
      post :create, answer_vote: {  }
    end

    assert_redirected_to answer_vote_path(assigns(:answer_vote))
  end

  test "should show answer_vote" do
    get :show, id: @answer_vote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @answer_vote
    assert_response :success
  end

  test "should update answer_vote" do
    patch :update, id: @answer_vote, answer_vote: {  }
    assert_redirected_to answer_vote_path(assigns(:answer_vote))
  end

  test "should destroy answer_vote" do
    assert_difference('AnswerVote.count', -1) do
      delete :destroy, id: @answer_vote
    end

    assert_redirected_to answer_votes_path
  end
end
