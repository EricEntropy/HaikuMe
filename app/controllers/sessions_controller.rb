class SessionsController < ApplicationController
    def new 
    end 

    def create
        if auth = request.env["omniauth.auth"]
            user = User.find_or_create_by(username: auth["info"][:nickname]) do |user|
                user.username = auth["info"][:nickname]
                user.password = 'password'
                user.password_confirmation = 'password'
            end
            session[:user_id] = user.id
            redirect_to users_path(user)
        else 
            @user = User.find_by(username: params[:user][:username])
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to '/'
            else 
                render 'sessions/new'
            end 
        end 
    end 

    def destroy
        session.delete :user_id
        redirect_to '/login'
    end 

    def create_through_github
        @user = User.find_or_create_by(username: auth[:name]) {|user| user.password = 'password'}
        session[:user_id] = @user.id
        redirect_to '/'
    end 

    private

    def auth
        request.env['omniauth.auth']["info"]
    end 
end 