class HaikusController < ApplicationController
  before_action :set_haiku, only: [:show, :edit, :update]

  def new
    @haiku = Haiku.new
  end

  def create
    @haiku = Haiku.create(haiku_params)
    redirect_to haiku_path(@recipe)
  end

  def edit
  end

  def update
    @haiku.update(haiku_params)
    redirect_to haiku_path(@haiku)
  end

  def index
    @haikus = Haiku.all
  end

  def show
  end

  private 

  def set_haiku
    @haiku = Haiku.find(params[:id])
  end 

  def haiku_params
    params.require(:haiku).permit(:title, :content, theme_ids:[])
  end 

end
