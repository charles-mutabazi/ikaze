class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    # @cover_page = true
    @user = User.find(params[:id])
    @posts = @user.posts.order('created_at DESC')

    @my_likes = 0
    @my_dislikes = 0
    @my_points = 0

    @posts.each do |post|
      @my_likes = @my_likes + post.up_votes_count
      @my_dislikes = @my_dislikes + post.down_votes_count
      @my_points = @my_points + post.votes_point
    end
  end

end
