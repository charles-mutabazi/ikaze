module Api
	module V1
		class MyPlacesController < ApplicationController

			respond_to :json

			def index
				respond_with MyPlace.all
			end

			def show
				respond_with MyPlace.find(params[:id])
			end

			def create
				respond_with MyPlace.create(my_place_params)
			end

			def update
        respond_with MyPlace.update(params[:id], params[:my_place])
      end

			def destroy
				respond_with MyPlace.destroy(params[:id])
			end


			private
      def my_place_params
				params.require(:my_place).permit(:device_id, :longitude, :latitude, :captured_at)
      end


		end
	end
end
