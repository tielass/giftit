class EventTagsController < ApplicationController
  def index
    @event_tags = EventTag.all
  end

  def show
    @event_tag = EventTag.find(params[:id])
  end
end
