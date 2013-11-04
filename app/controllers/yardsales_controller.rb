class YardsalesController < ApplicationController
  before_action :authenticate_user!, :only => [:add_to_trip, :add_to_favorite]
  
  def index
    @yardsales = Yardsale.newest(current_user)
  end
  
  def popular
    @yardsales = Yardsale.popular(current_user)
    @type = 'popular'
    render 'index'
  end
  
  def featured
    @yardsales = Yardsale.featured(current_user)
    @type = 'featured'
    render 'index'
  end
  
  def nearby
    @yardsales = Yardsale.nearby(current_user)
    @type = 'nearby'
    render 'index'
  end
  
  def show
    unless @yardsale = Yardsale.find_by_id(params[:id])
      redirect_to :back, :notice => "Yardsale not found"
    end
  end
  
  def add_to_trip
    if user_signed_in? && trip = current_user.trips.find_by_id(params[:trip_id]) && yardsale = Yardsale.find_by_id(params[:yardsale_id])
      trip.yardsales << yardsale
      flash[:notice] = 'Yardsale Successfully Added To Your List'
    end
    redirect_to :back
  end
  
  def add_to_favorite
    if user_signed_in? && yardsale = Yardsale.find_by_id(params[:yardsale_id])
      current_user.favorite_yardsales << yardsale
      flash[:notice] = 'Yardsale Successfully Added To Your Favorites'
    end
    redirect_to :back
  end
end