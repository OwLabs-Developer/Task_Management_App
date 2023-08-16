class ApplicationController < ActionController::Base
    helper_method :current_user

    add_flash_types :primary, :secondary, :light, :dark, :danger, :info, :warning, :success

    private
    
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    
end
