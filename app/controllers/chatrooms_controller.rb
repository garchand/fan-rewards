class ChatroomsController < ApplicationController
  def index
    policy_scope(Chatroom)
    @chatroom = Chatroom.find_by!(restaurant: Restaurant.find(params[:restaurant_id]))
    @message = Message.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def new
    @chatroom = Chatroom.new
  end


end
