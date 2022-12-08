require "pry"
class VotingsController < ApplicationController
  def show
    @voting.user = current_user
    @wishlistgift = Wishlistgift.find(params[:wishlistgift_id])
    @voting = Voting.find(params[:id])
    @event = Event.find(params[:id])
  end

  def create
    @wishlistgift = Wishlistgift.find(params[:wishlistgift_id])
    @event = @wishlistgift.event
    @voting = Voting.new(wishlistgift_id: @wishlistgift.id)
    @voting.user = current_user
    @voting.save
    render layout: false
  end

  def destroy
    @voting = Voting.find(params[:id])
    @wishlistgift = @voting.wishlistgift
    @event = @wishlistgift.event
    @voting.delete
    render layout: false
  end
end
