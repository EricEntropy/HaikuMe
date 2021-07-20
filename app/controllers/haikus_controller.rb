class HaikusController < ApplicationController
  before_action :set_haiku, only: [:show, :edit, :update, :destroy]

  def new
    if params[:user_id]
        user = User.find(params[:user_id])
        @haiku = user.haikus.build
    elsif !params[:user_id]
      @haiku = current_user.haikus.build
    else  
      redirect_to '/'
    end 
  end

  def create
    @haiku = current_user.haikus.build(haiku_params)
    if @haiku.valid?
      @haiku.save 
      redirect_to "/users/#{current_user.id}/haikus/#{@haiku.id}"
    else 
      render "new"
    end 

  end

  def edit
    if @haiku.user == current_user
      render "edit"
    else  
      redirect_to '/'
    end
  end

  def show
    if @haiku.user == current_user
      render "show"
    else 
      redirect_to '/'
    end
  end

  def update
    if @haiku.update(haiku_params) && (@haiku.user == current_user)
      redirect_to "/users/#{current_user.id}/haikus/#{@haiku.id}"
    else 
      render "edit"
    end 
  end

  def index
    if params[:user_id]
      @haikus = User.find(params[:user_id]).haikus
    else 
      @haikus = Haiku.all
    end 
  end

  def destroy
    @haiku.destroy
    redirect_to "/users/#{current_user.id}"
  end 

  private 

  def set_haiku
    @haiku = Haiku.find(params[:id])
  end 

  def haiku_params
    params.require(:haiku).permit(:title, :line_1, :line_2, :line_3, :user_id, theme_ids:[], themes_attributes:[:name])
  end 

end
