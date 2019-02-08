class CommentsController < ApplicationController
  before_action :set_post

  def index
    @comments = Comment.all
    p @comments
  end

  def create
    @comment = @post.comments.create!(user_id:current_user_id, content:params['content'], name:params['name'])
    redirect_to posts_path
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
