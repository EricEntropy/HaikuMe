class HaikusController < ApplicationController
  before_action :set_haiku, only: [:show, :edit, :update]

  def new
    @haiku = Haiku.new
  end

  def create
    @haiku = Haiku.new(haiku_params)
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
    redirect_to haiku_path(@haiku)
  end

  def index
    @haikus = Haiku.all
  end

  private 

  def set_haiku
    @haiku = Haiku.find(params[:id])
  end 

  def haiku_params
    params.require(:haiku).permit(:title, :line_1, :line_2, :line_3, :theme_ids => [], themes_attributes: [:name])
  end 

end
