class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    @my_restaurants = policy_scope(Restaurant)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end

  def new
    @restaurant = Restaurant.new
    authorize @restaurant
    raise
  end

  def create
    @restaurant = Restaurant.new(restaurants_params)
    @restaurant.user = current_user
    @chatroom = Chatroom.new
    @chatroom.restaurant_id = @restaurant.id
    authorize @restaurant
    if (@restaurant.save && @chatroom.save)
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def restaurants_params
    params.require(:restaurant).permit(:name, :description, :address)
  end
end
