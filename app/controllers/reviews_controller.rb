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
  end

  def edit
  end

  def create
    @coffeeshop = Coffeeshop.find(params[:coffeeshop_id])
    @review = @coffeeshop.reviews.new(review_params)
    @review.user = current_user

    @coffeeshop.increment("studyRating",   by = @review.studyRating)   if !@review.studyRating.nil?
    @coffeeshop.increment("qualityRating", by = @review.qualityRating) if !@review.qualityRating.nil?
    @coffeeshop.increment("laptopRating",  by = @review.laptopRating)  if !@review.laptopRating.nil?
    @coffeeshop.increment("hipsterRating", by = @review.hipsterRating) if !@review.hipsterRating.nil?

    if @review.save && @coffeeshop.save
      flash[:success] = "Review was added!"
      redirect_to coffeeshop_path(@coffeeshop)
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
      format.json { head :no_content }
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
