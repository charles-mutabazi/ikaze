class GpsCoordinatesController < ApplicationController
  before_action :set_gps_coordinate, only: [:show, :edit, :update, :destroy]

  def index
    @gps_coordinates = GpsCoordinate.all
  end

  def show
  end

  # DELETE /gps_coordinates/1
  # DELETE /gps_coordinates/1.json
  def destroy
    @gps_coordinate.destroy
    respond_to do |format|
      format.html { redirect_to gps_coordinates_url, notice: 'Gps coordinate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gps_coordinate
      @gps_coordinate = GpsCoordinate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gps_coordinate_params
      params.require(:gps_coordinate).permit(:device_id, :longitude, :latitude, :captured_at)
    end
end
