class WallsController < ApplicationController
  def index
    userwall = params['name']
    @wall_post = Post.where(user_wall: userwall)
  end

  def show
    redirect_to walls_url
  end


  def create
    @wall_post = Post.create(message: params[:post], user_id:current_user_id )
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

  def current_user_name
    current_user['user_name']
  end
end
