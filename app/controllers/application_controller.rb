class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :profile_pic, :phone_no])
        devise_parameter_sanitizer.permit(:update, keys: [:name, :username, :bio, :profile_pic, :phone_no, :is_private])
    end
end
