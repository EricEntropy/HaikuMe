class ThemesController < ApplicationController
  before_action :set_theme, only: [:show, :edit, :update]

  def new
    @theme = Theme.new
  end

  def create
    @theme = Theme.create(theme_params)
    redirect_to theme_path(@theme)
  end

  def edit
  end

  def update
    @theme.update(theme_params)
    redirect_to theme_path(@theme)
  end

  def index
    @themes = Theme.all
  end

  def show
  end

  private 

  def set_theme
    @theme = Theme.find(params[:id])
  end 

  def theme_params
    params.require(:theme).permit(:name)
  end 
end
