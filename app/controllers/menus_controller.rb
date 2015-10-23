class MenusController < ApplicationController
  before_action :is_logged_in_and_admin, only: [:new, :create, :destroy]

  def show 
    @menu = Menu.find(params[:id])
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

    def is_logged_in_and_admin
      unless current_user && current_user.admin?  
        flash[:danger] = "You do not have the ability to do that!"
        redirect_to root_url
      end
    end
end
