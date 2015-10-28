class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @coffeeshop = Coffeeshop.find(params[:coffeeshop_id])
    @review = @coffeeshop.reviews.new
    respond_to do |format|
      format.js
    end
  end

  def edit
  end

  def create
    @coffeeshop = Coffeeshop.find(params[:coffeeshop_id])
    @review = @coffeeshop.reviews.new(review_params)
    @review.user = current_user

    @coffeeshop.calculate_average_ratings

    if @review.save && @coffeeshop.save

    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
    end
  end

  private

    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:user_id, :body, :title, :qualityRating, :hipsterRating, :studyRating, :laptopRating, :coffeeshop_id)
    end
end
