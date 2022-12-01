class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def index
  end

  def profile
    @events = Event.where(user: current_user).order(start_time: :asc)
    @joinedevents = Event.joins(:members).where(members: { user: current_user })
  end
end
