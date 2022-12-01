class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.joins(event: :members).where(members: { user: current_user })
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
