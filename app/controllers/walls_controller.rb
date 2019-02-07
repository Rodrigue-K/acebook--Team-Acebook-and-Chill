class WallsController < ApplicationController

  def index
   
    session[:on_wall] = current_user_name
    @user = User.where(user_name: session[:on_wall])
    @wall_post = Post.where(user_wall: session[:on_wall])
  end

  def show
    redirect_to walls_url
  end


  def create
    @wall_post = Post.create(message: params[:post], user_id:current_user_id,  user_wall:session[:on_wall])
     username = session[:on_wall]
     redirect_to "/walls?name=#{username}"
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
    userwall = params['name'] ? params['name'] : current_user['user_name']
  end
end
