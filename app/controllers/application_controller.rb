class ApplicationController < ActionController::Base
    helper_method :current_user

    def home 
    end 


    private 

    def current_user
       @user ||= User.find_by(id: session[:user_id])
    end
    
    def logged_in? 
        session[:user_id]
    end 
end
