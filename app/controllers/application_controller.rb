class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
     
  
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end
   
    #attempt to make flash messages work with ajax
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :name, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password) }
  end
  #Allows user to add and edit name, must be here because rails 4 has moved this to controller, so cannot be in user model
     private
     
     def user_not_authorized
       flash[:alert] = "Oops!  You don't have permission to do this."
       redirect_to root_path
     end
end
