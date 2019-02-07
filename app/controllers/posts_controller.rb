class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(message: post_params[:message], user_id:current_user_id, user_wall:current_user_name)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def show
    redirect_to posts_url
  end

  def edit
    post_creator = Post.find(params[:id]).user_id

    if current_user_id === post_creator
      @post = Post.find(params[:id])
    else
      redirect_to posts_url
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to(post_path(@post))
  end


  def destroy
     post = Post.find(params[:id])
     post.destroy
     redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:message)
  end

  def current_user_id
    current_user['id']
  end


  def current_user_name
    current_user['user_name']
  end
end
