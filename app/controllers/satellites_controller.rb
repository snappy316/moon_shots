class SatellitesController < ApplicationController
  before_action :set_satellite, only: [:show, :edit, :update, :destroy]

  # GET /satellites
  # GET /satellites.json
  def index
    @satellites = Satellite.all
  end

  # GET /satellites/1
  # GET /satellites/1.json
  def show
  end

  # GET /satellites/new
  def new
    @satellite = Satellite.new
  end

  # GET /satellites/1/edit
  def edit
  end

  # POST /satellites
  # POST /satellites.json
  def create
    @satellite = Satellite.new(satellite_params)

    respond_to do |format|
      if @satellite.save
        format.html { redirect_to @satellite, notice: 'Satellite was successfully created.' }
        format.json { render :show, status: :created, location: @satellite }
      else
        format.html { render :new }
        format.json { render json: @satellite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /satellites/1
  # PATCH/PUT /satellites/1.json
  def update
    respond_to do |format|
      if @satellite.update(satellite_params)
        format.html { redirect_to @satellite, notice: 'Satellite was successfully updated.' }
        format.json { render :show, status: :ok, location: @satellite }
      else
        format.html { render :edit }
        format.json { render json: @satellite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /satellites/1
  # DELETE /satellites/1.json
  def destroy
    @satellite.destroy
    respond_to do |format|
      format.html { redirect_to satellites_url, notice: 'Satellite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_satellite
      @satellite = Satellite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def satellite_params
      params.require(:satellite).permit(:last_telemetry_timestamp)
    end
end
