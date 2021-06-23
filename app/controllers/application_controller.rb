class ApplicationController < ActionController::Base

    helper_method :current_user

    # def home 
    #     redirect_to '/login' unless current_user
    # end 

    # def current_user
    #     User.find_by(id: session[:user_id])
    # end
    
    # private 

    # def logged_in? 
    #     session[:user_id]
    # end 
end
