class GiftsChannel < ApplicationCable::Channel
  def subscribed
    gift = Chatroom.find(params[:id])
    stream_for gift
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
