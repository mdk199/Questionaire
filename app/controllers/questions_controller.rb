
class QuestionsController < ApplicationController
  layout "dashboard"

  skip_before_filter :authenticate_user!, :only => [:index, :show,:tagged,:search]
  load_and_authorize_resource :except => [:index, :show, :tagged,:search]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all_published_questions(current_user)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @questions }
    end
  end

  def interest_questions
    @questions = current_user.interest_questions
    respond_to do |format|
      format.html { render :index }
      format.json { render :json => @questions }
    end
  end

  def expertise_questions
    @questions = current_user.expertise_questions
    respond_to do |format|
      format.html { render :index }
      format.json { render :json => @questions }
    end
  end

  def all_questions
    @questions = Question.all_published_questions
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
    flash.now[:notice] = 'Question was successfully removed.'
    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
      format.js { render "questions/destroy", :layout => false }
    end
  end

  def flag
    @question = Question.find(params[:id])
    Flag.add_flaga(@question, current_user)
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

  def publish
    @question = Question.find(params[:id])
    Question.publish_question(@question)
    respond_to do |format|
      format.js { render "questions/publish", :layout => false }
      format.json { render json: @questions }
    end
  end

  def unpublish
    @question = Question.find(params[:id])
    Question.unpublish_question(@question)
    respond_to do |format|
      format.js { render "questions/unpublish", :layout => false }
      format.json { render json: @questions }
    end
  end

  def add_answer
    @question = Question.find(params[:id])
    @answer = Answer.new(:question_id  => @question.id)
    respond_to do |format|
      format.js {render "questions/add_answer", :layout => false}
    end
  end


  def tagged  
    @tag = Tag.find(params[:id])
    @questions = Question.tagged_with(@tag.name).where(:published=> true)
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @questions}
    end
  end

  def search
    @questions = Question.search {fulltext params[:text] do boost_fields :question => 2.0 end}.results
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @questions}
    end
  end
end