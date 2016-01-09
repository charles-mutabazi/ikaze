module Api
	module V1
		class PostsController < ApplicationController

			respond_to :json

			def index
				respond_with Post.all
			end

			def show
				respond_with Post.find(params[:id])
			end

			def create
				respond_with Post.create(gps_coordinate_params)
			end

			def update
        respond_with Post.update(params[:id], params[:gps_coordinate])
      end

			def destroy
				respond_with Post.destroy(params[:id])
			end


			private
			def post_params
		    params.require(:post).permit(:content, :post_image)
		  end


		end
	end
end
