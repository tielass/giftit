class ChatroomsController < ApplicationController
  def index
    @event = Event.new
    @chatrooms = Chatroom.joins(event: :members).where(members: { user: current_user })
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
