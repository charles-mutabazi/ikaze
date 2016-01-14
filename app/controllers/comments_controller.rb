class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = @post.id

    @comment.save!
    respond_to do |format|
      format.html {redirect_to request.referrer, :notice => "Comment Created!!!"}
      format.js # JavaScript response
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { render :layout => false }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_text)
  end

end
