class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :users
  before_action :logged_in
  protect_from_forgery with: :exception


  def users
    @users = User.all
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
  end

  protected 

  def logged_in
    if current_user
      walls_path
    end
  end
  

  def after_sign_in_path_for(resource)
    walls_path
  end

  def after_sign_up_path_for(resource)
    walls_path
  end
end
