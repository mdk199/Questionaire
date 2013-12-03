class QuestionsController < ApplicationController
  layout "dashboard"

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    if @question.save
      respond_to do |format|
        flash[:notice] = "Question created successfully."
        format.html { redirect_to root_path }
      end
    else
      respond_to do |format|
        flash[:error] = "Failed to create Question."
        format.html { render "new" }
      end
    end
  end
end