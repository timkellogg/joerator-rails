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
    @coffeeshop.qualityRating = 0 
    @coffeeshop.hipsterRating = 0
    @coffeeshop.laptopRating  = 0
    @coffeeshop.studyRating   = 0

    if @coffeeshop.save
      flash[:success] = "Coffeeshop was successfully created"
      redirect_to @coffeeshop
    else
      render 'new'
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
        :studyRating, :laptopRating, :hipsterRating, :imageLink, :webAddress, :city, :state,
        :opens_at, :closes_at, :price, :accepts_credit, :parking, :style, :vegan_friendly, 
        :veggie_friendly, :city, :state)
    end
end
