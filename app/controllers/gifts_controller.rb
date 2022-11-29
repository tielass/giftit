class GiftsController < ApplicationController
  def index
    @gifts = Gift.all
    # Filter category on gift index page
  end

  def show
    @gift = Gift.find(params[:id])
  end

end
