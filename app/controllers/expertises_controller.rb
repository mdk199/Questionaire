class ExpertisesController < ApplicationController
  layout "main.html.erb"

  load_and_authorize_resource
  
  # GET /expertises
  # GET /expertises.json
  def index
    @expertises = Expertise.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @expertises }
    end
  end

  # GET /expertises/1
  # GET /expertises/1.json
  def show
    @expertise = Expertise.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @expertise }
    end
  end

  # GET /expertises/new
  # GET /expertises/new.json
  def new
    e=Expertise.find_by_user_id(current_user.id)
    if e.present?
      @expertise = Expertise.find(e.id)
    else
      @expertise = Expertise.new
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @expertise }
    end
  end

  # GET /expertises/1/edit
  def edit
    @expertise = Expertise.find(params[:id])
  end

  # POST /expertises
  # POST /expertises.json
  def create
    @expertise = Expertise.new(params[:expertise])
   
    respond_to do |format|
      if @expertise.save
        format.html { redirect_to @expertise, notice: 'Expertise was successfully created.' }
        format.json { render json: @expertise, status: :created, location: @expertise }
      else
        format.html { render action: "new" }
        format.json { render json: @expertise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /expertises/1
  # PUT /expertises/1.json
  def update
    @expertise = Expertise.find(params[:id])

    respond_to do |format|
      if @expertise.update_attributes(params[:expertise])
        format.html { redirect_to @expertise, notice: 'Expertise was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @expertise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expertises/1
  # DELETE /expertises/1.json
  def destroy
    @expertise = Expertise.find(params[:id])
    @expertise.destroy

    respond_to do |format|
      format.html { redirect_to expertises_url }
      format.json { head :no_content }
    end
  end
end
