class ReviewsController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = @restaurant.reviews
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    review = Review.create(review_params)
    review.restaurant = @restaurant
    review.save
    redirect_to restaurant_reviews_path(@restaurant)
  end

  private
  def review_params
    params.require(:review).permit(:content, :rating, :restaurant)
  end
end
