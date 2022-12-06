class RestaurantsAmbassadorController < ApplicationController
  def new
    @restaurants_ambassador = RestaurantsAmbassador.new
  end
end
