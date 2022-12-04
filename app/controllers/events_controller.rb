class EventsController < ApplicationController
  def index
    @events = Event.where(
      start_time: Time.now.beginning_of_month.beginning_of_week..Time.now.end_of_month.end_of_week
    )
    @events = Event.all
  end

  def show
    # @gifts = Gift.where(category: params[:event_tags])
    @event = Event.find(params[:id])
    @gifts = Gift.where(category: @event.event_tags.pluck(:name))
    @members = @event.members.where(event_id: @event.id).joins(:user)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    @tags = JSON.parse(params[:event][:tag_list])
    @tags.map do |tag|
      EventTag.create(name: tag["value"], event: @event)
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
    redirect_to even_path(@event)
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
    params.require(:event).permit(:name, :members, :start_time, :price, :photo)
  end
end
