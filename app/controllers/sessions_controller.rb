class SessionsController < ApplicationController
    def new 
    end 

    def create 
        if @user = User.find_by(username: params[:user][:username])
            return redirect_to '/loging' unless @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to '/'
        else 
            redirect_to '/login'
        end 
    end 

    def destroy
        session.delete :user_id
        redirect_to '/'
    end 

end 