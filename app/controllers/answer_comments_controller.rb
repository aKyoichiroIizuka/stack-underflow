class AnswerCommentsController < ApplicationController
  before_action :set_answer_comment, only: [:show, :edit, :update, :destroy]

  # GET /answer_comments
  # GET /answer_comments.json
  def index
    @answer_comments = AnswerComment.all
  end

  # GET /answer_comments/1
  # GET /answer_comments/1.json
  def show
  end

  # GET /answer_comments/new
  def new
    @answer_comment = AnswerComment.new
  end

  # GET /answer_comments/1/edit
  def edit
  end

  # POST /answer_comments
  # POST /answer_comments.json
  def create
    @answer_comment = AnswerComment.new(answer_comment_params)

    respond_to do |format|
      if @answer_comment.save
        format.html { redirect_to @answer_comment, notice: 'Answer comment was successfully created.' }
        format.json { render :show, status: :created, location: @answer_comment }
      else
        format.html { render :new }
        format.json { render json: @answer_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answer_comments/1
  # PATCH/PUT /answer_comments/1.json
  def update
    respond_to do |format|
      if @answer_comment.update(answer_comment_params)
        format.html { redirect_to @answer_comment, notice: 'Answer comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer_comment }
      else
        format.html { render :edit }
        format.json { render json: @answer_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answer_comments/1
  # DELETE /answer_comments/1.json
  def destroy
    @answer_comment.destroy
    respond_to do |format|
      format.html { redirect_to answer_comments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer_comment
      @answer_comment = AnswerComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_comment_params
      params.require(:answer_comment).permit(:content, :user_id, :answer_id)
    end
end
