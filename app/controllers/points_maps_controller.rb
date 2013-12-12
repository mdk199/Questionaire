class PointsMapsController < ApplicationController
  layout "main.html.erb"
  # GET /points_maps
  # GET /points_maps.json
  def index
    @points_maps = PointsMap.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @points_maps }
    end
  end

  # GET /points_maps/1
  # GET /points_maps/1.json
  def show
    @points_map = PointsMap.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @points_map }
    end
  end

  # GET /points_maps/new
  # GET /points_maps/new.json
  def new
    @points_map = PointsMap.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @points_map }
    end
  end

  # GET /points_maps/1/edit
  def edit
    @points_map = PointsMap.find(params[:id])
  end

  # POST /points_maps
  # POST /points_maps.json
  def create
    @points_map = PointsMap.new(params[:points_map])

    respond_to do |format|
      if @points_map.save
        format.html { redirect_to @points_map, notice: 'Points map was successfully created.' }
        format.json { render json: @points_map, status: :created, location: @points_map }
      else
        format.html { render action: "new" }
        format.json { render json: @points_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /points_maps/1
  # PUT /points_maps/1.json
  def update
    @points_map = PointsMap.find(params[:id])

    respond_to do |format|
      if @points_map.update_attributes(params[:points_map])
        format.html { redirect_to @points_map, notice: 'Points map was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @points_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /points_maps/1
  # DELETE /points_maps/1.json
  def destroy
    @points_map = PointsMap.find(params[:id])
    @points_map.destroy

    respond_to do |format|
      format.html { redirect_to points_maps_url }
      format.json { head :no_content }
    end
  end
end
