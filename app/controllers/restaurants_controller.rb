class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show]
  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create!(params_rest)
    redirect_to restaurant_path(@restaurant)
  end

  private

  def params_rest
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def params_rest
    @restaurant = Restaurant.find(params[:id])
  end
end
