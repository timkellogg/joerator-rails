class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new 
  end

  def create
    @item = Item.new(item_params)
    @menu = Menu.find(item_params[:menu_id])
    @item.menu = @menu 

    if @item.save 
      
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

    def set_item 
      params.require(:item).permit(:menu_id, :name, 
                                   :description, :veggie_friendly,
                                   :vegan_friendly, :gluten_free, 
                                   :image_link, :price)
    end

end
