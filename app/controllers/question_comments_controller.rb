class QuestionCommentsController < ApplicationController
  before_action :set_question_comment, only: [:show, :edit, :update, :destroy]

  # GET /question_comments
  # GET /question_comments.json
  def index
    @question_comments = QuestionComment.all
  end

  # GET /question_comments/1
  # GET /question_comments/1.json
  def show
  end

  # GET /question_comments/new
  def new
    @question_comment = QuestionComment.new
  end

  # GET /question_comments/1/edit
  def edit
  end

  # POST /question_comments
  # POST /question_comments.json
  def create
    @question_comment = QuestionComment.new(question_comment_params)

    respond_to do |format|
      if @question_comment.save
        format.html { redirect_to @question_comment, notice: 'Question comment was successfully created.' }
        format.json { render :show, status: :created, location: @question_comment }
      else
        format.html { render :new }
        format.json { render json: @question_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /question_comments/1
  # PATCH/PUT /question_comments/1.json
  def update
    respond_to do |format|
      if @question_comment.update(question_comment_params)
        format.html { redirect_to @question_comment, notice: 'Question comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @question_comment }
      else
        format.html { render :edit }
        format.json { render json: @question_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_comments/1
  # DELETE /question_comments/1.json
  def destroy
    @question_comment.destroy
    respond_to do |format|
      format.html { redirect_to question_comments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_comment
      @question_comment = QuestionComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_comment_params
      params.require(:question_comment).permit(:question_id, :user_id, :content)
    end
end
