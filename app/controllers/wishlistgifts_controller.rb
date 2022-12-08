class WishlistgiftsController < ApplicationController
  def index
    @event = Event.find(params[:id])
    @gift = Gift.find(params[:id])
    @wishlistgift = Wishlistgift.all
  end

  def show
    @wishlistgift = Wishlistgift.find(params[:id])
  end

  def create
    @event = Event.find(params[:event_id])
    @gift = Gift.find(params[:gift_params])
    @wishlistgift = Wishlistgift.new(gift_id: @gift, event_id: @event)
    @wishlistgift.event = @event
    @wishlistgift.gift = @gift

    if @wishlistgift.save
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
