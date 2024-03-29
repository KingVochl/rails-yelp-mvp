class ReviewsController < ApplicationController
  before_action :find_restaurant, only: [:new, :create]
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(rev_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def rev_params
    params.require(:review).permit(:rating, :content)
  end
  
  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
