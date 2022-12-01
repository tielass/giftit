class GiftsController < ApplicationController
  def index
    @gifts = Gift.all
    # Filter category on gift index page
    @hiking_gifts = Gift.where(category: "Hiking").limit(2)
    @technology_gifts = Gift.where(category: "Technology").limit(2)
    @chocolate_gifts = Gift.where(category: "Chocolate").limit(2)
    @food_gifts = Gift.where(category: "Food").limit(2)
    @cooking_gifts = Gift.where(category: "Cooking").limit(2)
    @running_gifts = Gift.where(category: "Running").limit(2)
    @perfume_gifts = Gift.where(category: "Perfume").limit(2)
    @practical_gifts = Gift.where(category: "Practical").limit(2)
    @subscriptions_gifts = Gift.where(category: "Subscriptions").limit(2)
    @wellness_gifts = Gift.where(category: "Wellness").limit(2)
    @yoga_gifts = Gift.where(category: "Yoga").limit(2)
    @wildcard_gifts = Gift.where(category: "Wildcard").limit(2)
  end

  def show
    @gift = Gift.find(params[:id])
  end
end
