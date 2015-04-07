class MenusController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  
  def index
      @menus = Menu.all
  end

  def show
    @menu = Menu.find(params[:id])
    @categories = @menu.menu_items.tag_counts_on(:categories)
    if params[:tag]
      @menu_items = @menu.menu_items.tagged_with(params[:tag])
    else
      @mnu_items = @menu.menu_items
    end
  end
  
  def new
    @menu = Menu.new
  end
  
  def create
    @menu = Menu.new(menu_params)
    
    if @menu.save
      redirect_to @menu
    else
      render 'new'
    end
  end
  
  def edit
    @menu = Menu.find(params[:id])
  end
  
  def update
    @menu = Menu.find(params[:id])
    
    if @menu.update(menu_params)
      redirect_to @menu
    else
      render 'edit'
    end
  end
  
  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    
    redirect_to menus_path
  end
  
  def tag_cloud
    @tags = Menu.find(params[:id]).menu_items.tag_counts_on(:tags)
  end
    
  private
  
  def menu_params
    params.require(:menu).permit(:title, :text)
  end
  
end
