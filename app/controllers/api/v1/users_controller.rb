module Api
	module V1
		class UsersController < ApplicationController

			respond_to :json

			def index
				respond_with User.all
			end

			def show
				user = User.find(params[:id])
				respond_with(user, :only => [:name, :email, :created_at, :avatar_file_name], :include => {:posts => { :only => [:content, :latitude, :longitude, :post_image_file_name, :votes, :created_at] }, :user => {:only => [:name, :email, :_id]}})
			end

			# def create
			# 	respond_with Post.create(post_params)
			# end

			# def update
      #   respond_with User.update(params[:id], params[:user])
      # end

			# def destroy
			# 	respond_with Post.destroy(params[:id])
			# end


			# private
			# def post_params
		  #   params.require(:post).permit(:content, :post_image)
		  # end


		end
	end
end
