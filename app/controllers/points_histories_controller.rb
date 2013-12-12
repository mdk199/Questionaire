class PointsHistoriesController < ApplicationController
  layout "main.html.erb"
  # GET /points_histories
  # GET /points_histories.json
  def index
    @points_histories = PointsHistory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @points_histories }
    end
  end

  # GET /points_histories/1
  # GET /points_histories/1.json
  def show
    @points_history = PointsHistory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @points_history }
    end
  end

  # GET /points_histories/new
  # GET /points_histories/new.json
  def new
    @points_history = PointsHistory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @points_history }
    end
  end

  # GET /points_histories/1/edit
  def edit
    @points_history = PointsHistory.find(params[:id])
  end

  # POST /points_histories
  # POST /points_histories.json
  def create
    @points_history = PointsHistory.new(params[:points_history])

    respond_to do |format|
      if @points_history.save
        format.html { redirect_to @points_history, notice: 'Points history was successfully created.' }
        format.json { render json: @points_history, status: :created, location: @points_history }
      else
        format.html { render action: "new" }
        format.json { render json: @points_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /points_histories/1
  # PUT /points_histories/1.json
  def update
    @points_history = PointsHistory.find(params[:id])

    respond_to do |format|
      if @points_history.update_attributes(params[:points_history])
        format.html { redirect_to @points_history, notice: 'Points history was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @points_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /points_histories/1
  # DELETE /points_histories/1.json
  def destroy
    @points_history = PointsHistory.find(params[:id])
    @points_history.destroy

    respond_to do |format|
      format.html { redirect_to points_histories_url }
      format.json { head :no_content }
    end
  end
end
