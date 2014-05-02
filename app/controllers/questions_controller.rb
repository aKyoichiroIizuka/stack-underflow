class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy, :upvote, :downvote, :new_comment, :post_comment]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @comment = QuestionComment.new
    @comment.question_id = @question.id

    @answer = Answer.new
    @answer.question_id = @question.id
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end

  def new_comment
    @comment = QuestionComment.new
    @comment.question_id = @question.id
  end

  def upvote
    if current_user.nil?
      redirect_to root_path, notice: "Not logged in."
      return false
    end
    user_id = current_user.id
    @vote = QuestionVote.find_or_create_by(user_id: user_id)
    @vote.question_id = @question.id
    if @vote.value == -1
      @vote.value = 0
    else
      @vote.value = 1
    end
    @vote.save
    redirect_to @question, notice: "Question is upvoted. Your vote to this question is #{@vote.value} points."
  end

  def downvote
    if current_user.nil?
      redirect_to root_path, notice: "Not logged in."
      return false
    end
    user_id = current_user.id
    @vote = QuestionVote.find_or_create_by(user_id: user_id)
    @vote.question_id = @question.id
    if @vote.value == 1
      @vote.value = 0
    else
      @vote.value = -1
    end
    @vote.save
    redirect_to @question, notice: "Question is downvoted. Your vote to this question is #{@vote.value} points."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :id, :user_id, :content)
    end
end
