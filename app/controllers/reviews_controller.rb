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

    if @review.save && @coffeeshop.save
      @coffeeshop.calculate_average_ratings
      respond_to do |format|
        format.js { render :create }
      end
    else
      respond_to do |format|
        format.js { render :new }
      end
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
    @user = @review.user
    @coffeeshop = @review.coffeeshop
    if @review.destroy
      # Need to configure activejob so that this is a background process
      UserMailer.review_removed_email(@user, @coffeeshop).deliver_now
    end
  end

  private

    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:user_id, :body, :title,
                    :qualityRating, :hipsterRating, :studyRating,
                    :laptopRating, :coffeeshop_id)
    end
end
