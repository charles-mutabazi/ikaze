module Api
	module V1
		class GpsCoordinatesController < ApplicationController

			respond_to :json

			def index
				respond_with GpsCoordinate.all
			end

			def show
				respond_with GpsCoordinate.find(params[:id])
			end

			def create
				respond_with GpsCoordinate.create(gps_coordinate_params)
			end

			def update
        respond_with GpsCoordinate.update(params[:id], params[:gps_coordinate])
      end

			def destroy
				respond_with GpsCoordinate.destroy(params[:id])
			end


			private
      def gps_coordinate_params
				params.require(:gps_coordinate).permit(:device_id, :longitude, :latitude)
      end


		end
	end
end
