class CoffeeshopsController < ApplicationController
  before_action :set_coffeeshop, only: [:show, :edit, :update, :destroy]


  def index
    @came_from_search = false

    if params[:search]
      @coffeeshops = Coffeeshop.search(params[:search]).order(created_at: :desc)
      @came_from_search = true 
    elsif params[:search_location]
      @coffeeshops = Coffeeshop.search_location(params[:search_location]).order(created_at: :desc)
      @came_from_search = true 
    else 
      @coffeeshops = Coffeeshop.all.order(created_at: :desc).paginate(:page => params[:page])
    end
  end

  def show
    @reviews        = @coffeeshop.reviews.order(created_at: :desc).paginate(:page => params[:page])
    @ratings        = get_ratings(@coffeeshop)
    @average_rating = get_average_rating(@ratings)
  end

  def new
    @coffeeshop = Coffeeshop.new
  end

  def edit
  end

  def create
    @coffeeshop = Coffeeshop.new(coffeeshop_params)

    respond_to do |format|
      if @coffeeshop.save
        format.html { redirect_to @coffeeshop, notice: 'Coffeeshop was successfully created.' }
        
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @coffeeshop.update(coffeeshop_params)
        format.html { redirect_to @coffeeshop, notice: 'Coffeeshop was successfully updated.' }
        
      else
        format.html { render :edit }
        
      end
    end
  end

  def destroy
    @coffeeshop.destroy
    respond_to do |format|
      format.html { redirect_to coffeeshops_url, notice: 'Coffeeshop was successfully destroyed.' }
      
    end
  end

  private
    def set_coffeeshop
      @coffeeshop = Coffeeshop.find(params[:id])
    end

    def coffeeshop_params
      params.require(:coffeeshop).permit(:name, :address, :qualityRating, 
        :studyRating, :laptopRating, :hipsterRating, :imageLink, :webAddress, :city, :state)
    end
end
