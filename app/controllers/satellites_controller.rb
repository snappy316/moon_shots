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
    @satellite = Satellite.new

    respond_to do |format|
      if @satellite.save
        format.html { redirect_to satellites_path, notice: 'Satellite was successfully created.' }
        format.json { render :show, status: :created, location: satellites_path }
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

  # PATCH/PUT /satellites/parse
  # PATCH/PUT /satellites/parse.json
  def parse
    downlink_body = ActiveSupport::JSON.decode(params[:downlink_body])
    satellite = Satellite.find(downlink_body['satellite_id'])
    timestamp = DateTime.strptime(downlink_body['telemetry_timestamp'].to_s,'%s')

    redirect_to parser_path, error: "ERROR: Can't find a satellite with ID #{downlink_body['satellite_id']}" unless satellite
    redirect_to parser_path, error: "ERROR: Invalid timestamp" unless timestamp

    downlink_body['barrels'].each do |barrel|
      b = satellite.barrels.find(barrel['batch_id'])

      redirect_to parser_path, error: "ERROR: Can't find a barrel with ID #{barrel['batch_id']} on satellite #{downlink_body['satellite_id']}" unless b

      b.last_flavor_sensor_result = barrel['last_flavor_sensor_result']
      b.status = barrel['status']
      b.barrel_errors = barrel['errors']
      b.save!
    end

    satellite.update_attributes!(last_telemetry_timestamp: timestamp)

    redirect_to parser_path, notice: 'Parsed successfully'
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
