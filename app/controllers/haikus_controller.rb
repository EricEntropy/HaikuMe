class HaikusController < ApplicationController
  before_action :set_haiku, only: [:show, :edit, :update, :destroy]
  def new
    @haiku = current_user.haikus.build
  end

  def create
    @haiku = current_user.haikus.build(haiku_params)
    if @haiku.valid?
      @haiku.save 
      redirect_to @haiku
    else 
      render '/haikus/new'
    end 

  end

  def edit
    
  end

  def show
  end

  def update
    @haiku.update(haiku_params)
    redirect_to @haiku
  end

  def index
    @haikus = Haiku.all
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
    params.require(:haiku).permit(:title, :line_1, :line_2, :line_3, :user_id, :theme_ids => [], themes_attributes: [:name])
  end 

end
