class ApplicationController < ActionController::Base

    helper_method :current_user

    def home 
        redirect_to '/login' unless current_user
    end 

    def current_user
        session[:username]
    end 

end
