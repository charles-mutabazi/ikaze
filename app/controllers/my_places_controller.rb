class MyPlacesController < ApplicationController
  before_action :set_my_place, only: [:show, :edit, :update, :destroy]

  def index
    @my_places = MyPlace.all
  end

  def show
  end

  # DELETE /my_places/1
  # DELETE /my_places/1.json
  def destroy
    @my_place = MyPlace.find(params[:id])
    @my_place.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  def remove_all
    MyPlace.delete_all
    flash[:notice] = "You have deleted all data!"
    redirect_to my_places_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_place
      @my_place = MyPlace.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def my_place_params
      params.require(:my_place).permit(:device_id, :address, :longitude, :latitude, :captured_at)
    end
end
