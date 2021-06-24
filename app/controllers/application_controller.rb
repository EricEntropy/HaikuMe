class ApplicationController < ActionController::Base

    helper_method :current_user

    def current_user
        User.find_by(id: session[:user_id])
    end
    
    private 

    def logged_in? 
        session[:user_id]
    end 
end
