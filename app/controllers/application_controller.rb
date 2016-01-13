class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end
   protect_from_forgery

    after_filter :flash_to_headers

    def flash_to_headers
        return unless request.xhr?
        response.headers['X-Message'] = flash_message
        response.headers["X-Message-Type"] = flash_type.to_s

        flash.discard # don't want the flash to appear when you reload page
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

    def flash_message
        [:error, :warning, :notice].each do |type|
            return flash[type] unless flash[type].blank?
        end
    end

    def flash_type
        [:error, :warning, :notice].each do |type|
            return type unless flash[type].blank?
        end
    end
    #attempt to make flash messages work with ajax
end
