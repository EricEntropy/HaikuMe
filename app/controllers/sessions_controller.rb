class SessionsController < ApplicationController
    def new 
    end 

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user == nil
            flash[:notice] = "Incorrect Username/Password"
            redirect_to login_path
        elsif @user.provider
            flash[:notice] = "Omniauth User Found. Please Use Github"
            redirect_to login_path
        else 
            @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to '/'
        end 
    end 

    def destroy
        session.delete :user_id
        redirect_to '/login'
    end 

    def create_through_github
        if auth = request.env["omniauth.auth"]
            user = User.find_or_create_by(username: auth["info"][:nickname]) do |user|
                user.username = auth["info"][:nickname]
                user.provider = auth.provider
                user.uid = auth.uid
                user.password = auth.uid + auth.provider
                user.password_confirmation = auth.uid + auth.provider
            end
            session[:user_id] = user.id
            redirect_to users_path(user)
        end
    end 

    private

    def auth
        request.env['omniauth.auth']["info"]
    end 
end 