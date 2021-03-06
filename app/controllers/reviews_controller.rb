class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new()
  end

  def create
    @review = Review.new(review_parameters)
    @review.restaurant_id = params[:restaurant_id]
    @restaurant = Restaurant.find(@review.restaurant_id)
    if @review.save
      redirect_to restaurant_path(@review.restaurant_id)
    else
      render :new
    end
  end

  private

  def review_parameters
    params.require(:review).permit(:content, :rating)
  end
end
