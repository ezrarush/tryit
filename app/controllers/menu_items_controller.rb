class MenuItemsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  
  def show
    @menu_item = MenuItem.find(params[:id])
  end
  
  def edit
    @menu_item = MenuItem.find(params[:id])
  end
  
  def update
    @menu_item = MenuItem.find(params[:id])
    
    if @menu_item.update(menu_item_params)
      redirect_to @menu_item.menu
    else
      render 'edit'
    end
  end
  
  def create
    @menu = Menu.find(params[:menu_id])
    @menu_item = @menu.menu_items.create(menu_item_params)
    redirect_to menu_path(@menu)
  end
  
  def destroy
    @menu = Menu.find(params[:menu_id])
    @menu_item = @menu.menu_items.find(params[:id])
    @menu_item.destroy
    redirect_to menu_path(@menu)
  end
    
  private
    def menu_item_params
      params.require(:menu_item).permit(:name, :text, :price, :tag_list)
    end
end
