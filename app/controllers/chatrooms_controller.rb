class ChatroomsController < ApplicationController
  def index
    policy_scope(Chatroom)
    @chatroom = Chatroom.find_by(restaurant: Restaurant.find(params[:restaurant_id]))
    @message = Message.new
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(restaurant_id: 5, name: "AA")
  end
end
