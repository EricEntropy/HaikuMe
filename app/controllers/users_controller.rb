class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else 
      redirect_to '/signup'
    end 
  end

  def show
    redirect_to '/' unless logged_in?
  end

  private
  
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end 

  def set_user
    @user = User.find_by(id: params[:id])
  end 
end
