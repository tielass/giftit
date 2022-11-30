class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def index
  end

  def profile
    @events = Event.where(user: current_user).order(start_time: :asc)
    # @joinedevent = Event.joins(Member.user_id: current_user_id)
    @joinedevents = Event.joins(:members).where(members: {user: current_user })
  end
end
