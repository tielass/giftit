class EventsController < ApplicationController
  def index
    @events = Event.where(
      start_time: Time.now.beginning_of_month.beginning_of_week..Time.now.end_of_month.end_of_week
    )
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    tags = JSON.parse(params[:event][:tag_list])
    tags.each do |tag|
      @event.tag_list.add(tag["value"])
    end
    if @event.save
      redirect_to event_path(@event)
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
    params.require(:event).permit(:name, :start_time, :price, :photo)
  end
end
