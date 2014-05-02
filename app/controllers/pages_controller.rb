class PagesController < ApplicationController
  def index
  	@questions = Question.all.order("updated_at DESC")
  end
end
