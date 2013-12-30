class AnswersController < ApplicationController
  layout "main.html.erb"
  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @answers }
    end
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
    @answer = Answer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @answer }
    end
  end

  # GET /answers/new
  # GET /answers/new.json
  def new
    @answer = Answer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @answer }
    end
  end

  # GET /answers/1/edit
  def edit
    @answer = Answer.find(params[:id])
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new(params[:answer])

    respond_to do |format|
      if @answer.save
        flash.now[:notice] = 'Answer was successfully created.'
        format.html { redirect_to @answer }
        format.json { render json: @answer, status: :created, location: @answer }
        format.js { render "answers/create", :layout => false }
      else
        format.html { render action: "new" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
        format.js do
          render "answers/create", :layout => false
        end
      end
    end
  end

  # PUT /answers/1
  # PUT /answers/1.json
  def update
    @answer = Answer.find(params[:id])

    respond_to do |format|
      if @answer.update_attributes(params[:answer])
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy

    flash.now[:notice] = 'Answer was successfully removed.'
    respond_to do |format|
      format.html { redirect_to answers_url }
      format.json { head :no_content }
      format.js { render "answers/destroy", :layout => false }
    end
  end

  def approve
    @answer = Answer.find(params[:id])
    @unapproved_answer = Answer.where("question_id = #{@answer.question_id} AND approved = 1").try(:first)
    @answer.approve
    respond_to do |format|
      format.js { render "answers/approve", :layout => false }
      format.json { render json: @answers }
    end
  end

  def unapprove
    @answer = Answer.find(params[:id])
    @answer.approved=0
    @answer.save
    respond_to do |format|
      format.js { render "answers/unapprove", :layout => false }
      format.json { render json: @answers }
    end
  end
end