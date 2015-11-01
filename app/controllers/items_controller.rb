class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :destroy, :update]

  def index
    @items = Item.all
  end

  def new
    @menu = Menu.find(params[:menu_id])
    @item = Item.new 
  end

  def create
    # whitelist menu_id 
    @menu = Menu.find(params[:menu_id])
    @item = Item.new(item_params)
    @item.menu = @menu 

    if @item.save 
      redirect_to menu_path(@menu) 
    else
      render 'new'
    end
  end

  def edit
    @menu = Menu.find(params[:menu_id])
  end

  def update
    if @item.update_attributes(item_params)
      flash[:success] = "Updates saved."
      redirect_to @item.menu
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy 
  end

  private 
    def set_item 
      @item = Item.find(params[:id])
    end

    def item_params 
 
      params.require(:item).permit(:menu_id, :name, 
                                   :description, :veggie_friendly,
                                   :vegan_friendly, :gluten_free, 
                                   :picture, :price, :meal_type)
    end
end

