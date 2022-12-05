class GiftsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @gifts = Gift.all
    # Filter category on gift index page
    @hiking_gifts = Gift.where(category: "Hiking").sample(2)
    @technology_gifts = Gift.where(category: "Technology").sample(2)
    @chocolate_gifts = Gift.where(category: "Chocolate").sample(2)
    @food_gifts = Gift.where(category: "Food").sample(2)
    @cooking_gifts = Gift.where(category: "Cooking").sample(2)
    @running_gifts = Gift.where(category: "Running").sample(2)
    @perfume_gifts = Gift.where(category: "Perfume").sample(2)
    @practical_gifts = Gift.where(category: "Practical").sample(2)
    @subscriptions_gifts = Gift.where(category: "Subscriptions").sample(2)
    @wellness_gifts = Gift.where(category: "Wellness").sample(2)
    @yoga_gifts = Gift.where(category: "Yoga").sample(2)
    @wildcard_gifts = Gift.where(category: "Wildcard").sample(2)
  end

  def show
    @gift = Gift.find(params[:id])
  end
end
