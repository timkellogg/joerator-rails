class CoffeeshopsController < ApplicationController
  before_action :is_logged_in_and_admin, only: [:edit, :update, :destroy, :approve ]
  before_action :set_coffeeshop, only: [:show, :edit, :update, :destroy, :favorite, :unfavorite, :approve ]

  def index
    @came_from_search = false
    @show_map = false

    # Searching matches
    if params[:search]
      @coffeeshops = Coffeeshop.where(approved: true).search(params[:search]).order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)
      @came_from_search = true
    elsif params[:search_location]
      @coffeeshops = Coffeeshop.where(approved: true).search_location(params[:search_location]).order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)
      @came_from_search = true
      @show_map  = true

    # Sorting matches
    elsif params[:sort] == 'biggest_menu'
      @coffeeshops = Coffeeshop.where(approved: true).order(items_count: :desc).paginate(:page => params[:page], :per_page => 10)
    elsif params[:sort] == "highest_rated"
      @coffeeshops = Coffeeshop.where(approved: true).order(overall_average: :desc).paginate(:page => params[:page], :per_page => 10)
    elsif params[:sort] == "most_recent"
      @coffeeshops = Coffeeshop.where(approved: true).order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)
    elsif params[:sort] == "most_reviewed"
      @coffeeshops = Coffeeshop.where(approved: true).order(reviews_count: :desc).paginate(:page => params[:page], :per_page => 10)
    elsif params[:sort] == "best_study"
      @coffeeshops = Coffeeshop.where(approved: true).order(average_study: :desc).paginate(:page => params[:page], :per_page => 10)
    elsif params[:sort] == "best_quality"
      @coffeeshops = Coffeeshop.where(approved: true).order(average_quality: :desc).paginate(:page => params[:page], :per_page => 10)
    elsif params[:sort] == "best_hipster"
      @coffeeshops = Coffeeshop.where(approved: true).order(average_hipster: :desc).paginate(:page => params[:page], :per_page => 10)
    else
      @coffeeshops = Coffeeshop.where(approved: true).order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)
    end
  end

  def show
    @reviews = @coffeeshop.reviews.order(created_at: :desc).paginate(:page => params[:page])

    if @coffeeshop.menu
      @menu = @coffeeshop.menu
    end
  end

  def new
    @coffeeshop = Coffeeshop.new
  end

  def edit
  end

  def create
    @coffeeshop = Coffeeshop.new(coffeeshop_params)

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
      format.js   { render :js => "window.location = '/'" }
      format.html { redirect_to coffeeshops_url, notice: 'Coffeeshop was successfully destroyed.' }
    end
  end

  # Custom routing
  def highest
    @coffeeshops = Coffeeshop.sort(average_rating: :desc).paginate(:page => params[:page])
  end

  def favorite
    if current_user.coffeeshops << @coffeeshop
      respond_to do |format|
        format.js
        # in favorite.js.erb should render the unfavorite link
      end
    end
  end

  def unfavorite
    @coffeeshop.users.delete(User.find current_user.id)
    respond_to do |format|
      format.js
    end
  end

  # Approves the coffeeshop
  def approve
    @coffeeshop.approved = true
    if @coffeeshop.save
      respond_to do |format|
        format.js
      end
    end
  end

  private

    def is_logged_in_and_admin
      unless current_user && current_user.admin?
        flash[:danger] = "You do not have the ability to do that!"
        redirect_to root_url
      end
    end

    def set_coffeeshop
      @coffeeshop = Coffeeshop.find(params[:id])
    end

    def coffeeshop_params
      params.require(:coffeeshop).permit(:name, :address, :qualityRating,
        :studyRating, :laptopRating, :hipsterRating, :imageLink, :webAddress, :city, :state,
        :opens_at, :closes_at, :price, :accepts_credit, :parking, :style, :vegan_friendly,
        :veggie_friendly, :city, :state, :picture)
    end
end
