class MenusController < ApplicationController

  def show 
  end

  def new 
    @coffeeshop = Coffeeshop.find(params[:coffeeshop_id])
    @menu = Menu.new
  end

  def create
    @coffeeshop = Coffeeshop.find(params[:coffeeshop_id])
    @menu = Menu.new 
    @coffeeshop.menu = @menu

    if @menu.save 
      flash[:success] = "Menu was added"
      redirect_to @menu
    else 
      redirect_to @coffeeshop
    end
  end

  def destroy 
    menu = Menu.find(params[:id])
    coffeeshop = menu.coffeeshop 
    menu.delete 
    redirect_to coffeeshop
  end

  private

    def menu_params
      params.require(:menu).permit(:coffeeshop_id)
    end
end
