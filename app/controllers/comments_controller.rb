class CommentsController < ApplicationController
  before_action :set_post

  def create
  # building a new @comment object and assigning it in the user_name field based on the user currently logged in
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

# if the comment is saved
    if @comment.save
      flash[:success] = "You have placed your comment"
      redirect_to :back
    else
      flash[:alert] = "Something has gone wrong"
      render root_path
    end
  end


  def destroy
  @comment = @post.comments.find(params[:id])

  @comment.destroy
  flash[:success] = "Comment deleted"
  redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

# Setting the post instance vairable to the post from the Post model based on post_id params
end

# comments table has user_id and post_id
