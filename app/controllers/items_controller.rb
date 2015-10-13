class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :destroy]

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
      redirect_to :back
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private 
    def item_params 
      params.require(:item).permit(:menu_id, :name, 
                                   :description, :veggie_friendly,
                                   :vegan_friendly, :gluten_free, 
                                   :image_link, :price, :meal_type)
    end
end

