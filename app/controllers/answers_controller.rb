class AnswersController < ApplicationController
  layout "main.html.erb"

  load_and_authorize_resource :except => [:add_comment]
  
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
    @answer = Answer.new(:user_id => current_user.id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @answer }
    end
  end

  # GET /answers/1/edit
  def edit
    @answer = Answer.find(params[:id])
    respond_to do |format|
      if @answer.save
        format.html
        format.json { render json: @answer }
        format.js { render "answers/edit", :layout => false }
      end
    end
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new(params[:answer])

    respond_to do |format|
      if @answer.save
        @answer.create_activity :create, owner: current_user
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
    if @answer.user == current_user
      @answer.approved = false
    end
    respond_to do |format|
      if @answer.update_attributes(params[:answer])
        @answer.create_activity :update, owner: current_user
        flash.now[:notice] = 'Answer was successfully updated.'
        format.html
        format.json { head :no_content }
        format.js { render "answers/create", :layout => false }
      else
        format.html { render action: "edit" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
        format.js { render "answers/create", :layout => false }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer = Answer.find(params[:id])
    @answer.create_activity :destroy, owner: @answer.user
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
    @answer.create_activity :approves, owner: current_user
    @answer.create_activity :got_approved, owner: @answer.user
    respond_to do |format|
      format.js { render "answers/approve", :layout => false }
      format.json { render json: @answers }
    end
  end

  def unapprove
    @answer = Answer.find(params[:id])
    @answer.approved=0
    @answer.save
    @answer.create_activity :unapproves, owner: current_user
    @answer.create_activity :got_unapproved, owner: @answer.user
    respond_to do |format|
      format.js { render "answers/unapprove", :layout => false }
      format.json { render json: @answers }
    end
  end
  def add_comment
    @answer = Answer.find(params[:id])
    @comment = Comment.new(:answer_id  => @answer.id)
    respond_to do |format|
      format.js {render "answers/add_comment", :layout => false}
    end
  end
end