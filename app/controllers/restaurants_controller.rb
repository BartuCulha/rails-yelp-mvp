class RestaurantsController < ApplicationController
  before_action :select_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @reviews = @restaurant.reviews
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new()
  end

  def new
    @restaurant = Restaurant.new()
  end
  def create
    @restaurant = Restaurant.new(restaurant_parameters)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end
  def edit
  end
  def update
    if @restaurant.update(restaurant_parameters)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end
  def destroy
    @restaurant.destroy
    redirect_to restaurant_path
  end

  private
  def select_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
  def restaurant_parameters
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
