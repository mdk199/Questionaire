class QuestionsController < ApplicationController
  layout "main.html.erb"
  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.where(:user_id=>current_user.id).find(:all, :include=>"answers")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions }
    end
  end

  def all_questions
    @questions = Question.find(:all, :include=>"answers")
    respond_to do |format|
      format.html # all_question.html.erb
      format.json { render json: @questions }
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @question = Question.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.json
  def new
    @question = Question.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(params[:question])
  
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.json
  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end

  def answers
    @answers =  Answer.where("question_id = #{params[:id]}")
    render "/answers/index"
  end

  def flag
    @question = Question.find(params[:id])
    Flag.add_flag(@question, current_user)
    respond_to do |format|
      format.js { render "questions/flag", :layout => false }
      format.json { render json: @questions }
    end
  end

  def unflag
    @question = Question.find(params[:id])
    Flag.remove_flag(@question, current_user)
    respond_to do |format|
      format.js { render "questions/unflag", :layout => false }
      format.json { render json: @questions }
    end
  end
end
