module Api
	module V1
		class PostsController < ApplicationController

			respond_to :json

			def index
				posts = Post.all()
				# respond_with posts

				# much more cleaner json
				respond_with(posts, :only => [:content, :created_at, :latitude, :longitude, :post_image_file_name, :votes ], :include => {:comments => { :only => [:comment_text, :created_at] }, :user => {:only => [:name, :email, :_id, :avatar_file_name]}})

			end

			def show
				post = Post.find(params[:id])
				respond_with(post, :only => [:content, :created_at, :latitude, :longitude, :post_image_file_name, :votes ], :include => {:comments => { :only => [:comment_text, :created_at] }, :user => {:only => [:name, :email, :_id]}})
			end

			def create
				respond_with Post.create(post_params)
			end

			def update
        respond_with Post.update(params[:id], params[:post])
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
