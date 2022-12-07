class EventsController < ApplicationController
  def index
    @events = Event.where(
      start_time: Time.now.beginning_of_month.beginning_of_week..Time.now.end_of_month.end_of_week
    )
    @events = Event.all
  end

  def show
    target_event = params[:id]
    price_range = params[:eventidprice].present? ? params[:eventidprice] : params[:eventidpriceprice]

    # @members = @event.members.where(event_id: @event.id).joins(:user)
    if target_event.present? && price_range.present?
    @event = Event.find(params[:id])
    # @gifts = Gift.where(category: @event.event_tags.pluck(:name))
    @gifts =  Gift.where(category: JSON.parse(@event.hobbies).pluck("value"))
    @wishlistgift = Wishlistgift.where(event_id: @event.id, gift_id: @gifts)
    @event.price = price_range.to_i
    @event.save!

    @filtiergifts = @gifts.reject do |filtergift|
      filtergift.price > price_range.to_i
    end

    @gifts = @filtiergifts.reject do |gift|
      gift.wishlistgifts.any? do |wlg|
        @wishlistgift.include?(wlg)
      end
    end
    else

      @event = Event.find(params[:id])
      # @gifts = Gift.where(category: @event.event_tags.pluck(:name))
      @gifts =  Gift.where(category: JSON.parse(@event.hobbies).pluck("value"))
      @wishlistgift = Wishlistgift.where(event_id: @event.id, gift_id: @gifts)

      @filtiergifts = @gifts.reject do |filtergift|
        filtergift.price > @event.price
      end

      @gifts = @filtiergifts.reject do |gift|
        gift.wishlistgifts.any? do |wlg|
          @wishlistgift.include?(wlg)
        end
      end
    end
    @members = @event.members.where(event_id: @event.id).joins(:user).select(('DISTINCT user_id'))
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    @tags = JSON.parse(params[:event][:hobbies])
    @tags.map do |tag|
      if tag["value"].present?
        EventTag.create(name: tag["value"], event_id: @event.id)
      else
        flash.notice = "Sorry we can't find any gifts in this pricerange"
      end
      # @event.tag_list.add(tag["value"])
    end

    if @event.save
      redirect_to event_path(@event)
      @member = Member.new(user_id: current_user.id, event_id: @event.id)
      @member.save
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  def tag_list
    tags.map(&:name).join(",")
  end

  private

  def event_params
    params.require(:event).permit(:name, :members, :start_time, :price, :photo, :hobbies)
  end
end
