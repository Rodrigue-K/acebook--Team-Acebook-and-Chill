class WallsController < ApplicationController
  def index
    @wall_post = Post.all
  end

  def show
    redirect_to walls_url
  end


  def create
    p "no i dint get here"
    @wall_post = Post.create(message: params[:post], user_id:current_user_id)
    redirect_to walls_url
  end

  def new 
    @wall_post = Post.new
  end


  private

  # def wall_post_params
  #   params.require(:post).permit(:message)
  # end

  def current_user_id
    current_user['id']
  end
end
