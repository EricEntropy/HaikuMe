class SessionsController < ApplicationController
    def new 
    end 

    def create 
        if params[:username].present?
            session[:username] = params[:username]
            redirect_to root_path
        else 
            redirect_to '/login'
        end 
    end 

    def destroy
        if session[:username].present? 
            session.delete :username
            redirect_to '/login'
        end 
    end 

end 