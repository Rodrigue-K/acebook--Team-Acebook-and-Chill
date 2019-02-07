class CommentsController < ApplicationController
  before_action :set_post

  def index
    @comment = Comment.new
  end

  def create
  # building a new @comment object and assigning it in the user_name field based on the user currently logged in
  p Comment
  p 'hello i is here'

  p @post
    
    @comment = @post.comment.create!(user_id:current_user_id, content:params['content'])
    # @comment.user_id = current_user.id
    # redirect_to post_comment_url

# # if the comment is saved
#     if @comment.save
#       flash[:success] = "You have placed your comment"
#       redirect_to :back
#     else
#       flash[:alert] = "Something has gone wrong"
#       render root_path
#     end
 end


  def destroy
  @comment = @post.comments.find(params[:id])

  @comment.destroy
  flash[:success] = "Comment deleted"
  redirect_to root_path
  end

  private

 

  def set_post
    @post = Post.find(params[:post_id])
  end


  def current_user_id
    current_user['id']
  end

end 

# Setting the post instance vairable to the post from the Post model based on post_id params


# comments table has user_id and post_id
